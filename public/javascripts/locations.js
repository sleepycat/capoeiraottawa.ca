
var map_centre = new google.maps.LatLng(45.4205, -75.6989);
var initialize = function(){
    $('.notice').delay(2000).fadeOut(2000);
    
    var markers = [];
    var infowindow = new google.maps.InfoWindow();
  
    function load_content(marker, id){
        $.ajax({
            url: 'locations/' + id,
            success: function(data){
                infowindow.setContent(data);
                infowindow.open(map, marker);
            }
        });
    }

    var mystyle = [ { featureType: "water", elementType: "all", stylers: [ { saturation: -38 }, { visibility: "simplified" }, { hue: "#1aff00" } ] },{ featureType: "landscape", elementType: "all", stylers: [ { hue: "#1aff00" }, { saturation: 0 } ] },{ featureType: "landscape", elementType: "all", stylers: [ { visibility: "simplified" }, { hue: "#1aff00" } ] },{ featureType: "road", elementType: "all", stylers: [ { visibility: "on" }, { hue: "#33ff00" }, { saturation: -81 } ] } ];

    var s = 'Styled';
    var opt = {
        mapTypeControlOptions: {
            mapTypeIds: [google.maps.MapTypeId.ROADMAP, s]
        },
        zoom: 8,
        mapTypeId: s
    };
    var styledMapType = new google.maps.StyledMapType(mystyle, {
        name: s
    });

    var map = new google.maps.Map(document.getElementById('map_canvas'), opt);


    map.mapTypes.set(s, styledMapType);
    map.setCenter(map_centre);
    map.setZoom(14);

    var image = new google.maps.MarkerImage('/images/gcsja.png',
        // The size in pixels of the image
        new google.maps.Size(26, 32),
        // The origin of the image.
        new google.maps.Point(0,0),
        // The pixel value of the actual point of pointer.
        new google.maps.Point(13, 32));

    var shadow = new google.maps.MarkerImage('/images/gcsja_shadow.png',
        new google.maps.Size(37, 32),
        new google.maps.Point(0,0),
        new google.maps.Point(13, 32));

    //this traces out the clickable region of the marker. 
    //Look into refining this:
    var shape = {
        coord: [1, 1, 1, 20, 18, 20, 18 , 1],
        type: 'poly'
    };
    
    $.ajax({
        url: 'locations/',
        method: 'GET',
        dataType: 'json',
        success: function(data){
           
            $.each(data, function(i, a){
                
                var latlng = new google.maps.LatLng(a.location.lat, a.location.lng);

                var marker = new google.maps.Marker({
                    position : latlng,
                    icon: image,
                    shadow: shadow,
                    shape: shape,
                    title: a.location.name
                });


                google.maps.event.addListener(marker, 'closeclick', function() {
                    infowindow.setContent("");
                });


                google.maps.event.addListener(marker, 'click', function() {
    
                    infowindow.close();

                    infowindow.setContent("<img src='loading.gif'>");

                    load_content(marker, a.location.id);
                });

             marker.setMap(map);
            });
        
        }

    });

};
