
var map_centre = new google.maps.LatLng(45.4045, -75.6989);
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
        zoom: 9,
        mapTypeId: s
    };
    var styledMapType = new google.maps.StyledMapType(mystyle, {
        name: s
    });

    var map = new google.maps.Map(document.getElementById('map_canvas'), opt);


    map.mapTypes.set(s, styledMapType);
    map.setCenter(map_centre);
    map.setZoom(13);

    
    $.ajax({
        url: 'locations/',
        method: 'GET',
        dataType: 'json',
        success: function(data){
           
            $.each(data, function(i, a){
                
                var latlng = new google.maps.LatLng(a.location.lat, a.location.lng);

                var marker = new google.maps.Marker({
                    position : latlng,
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
