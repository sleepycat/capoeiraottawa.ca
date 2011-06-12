$(function(){
  $('.notice').delay(2000).fadeOut(2000);
  
  var locale = window.location.pathname.split('/')[1]

  $('#get_video').bind('click', function(){
    
    var yt_id = $('#video_youtube_id').val()
    
    if(yt_id.match(/(\w|-){11,16}/)){
      
      $('#video_youtube_id').css({'border':'1px solid #3C3C3C'});

    $.ajax({
       url: '/' + locale + '/videos/new'
      ,dataType: 'json'
      ,type: 'GET'
      ,data: {"youtube_id":yt_id}
      ,success: function(data){
        $("#large_thumbnail").attr("src", data.large_thumbnail);
        $("#video_large_thumbnail").val(data.large_thumbnail);
        $("#video_small_thumbnail").val(data.small_thumbnail);
        $("#video_title").val(data.title);
        $("#video_duration").val(data.duration);
        $("#video_uploader").val(data.uploader);
        $("#video_description").val(data.description);
        $("#video_url").val(data.url);
      }
    })
    }
    else{
      $('#video_youtube_id').val("Not a recognizable video ID").css({'border':'5px solid #f00'});
    }
  });
});
