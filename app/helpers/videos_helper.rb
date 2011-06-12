module VideosHelper
  def embed vid
    "<iframe class='youtube-player' type='text/html' width=580 height=385 src='http://www.youtube.com/embed/#{vid.youtube_id}' frameborder =0></iframe>".html_safe
  end
  
end
