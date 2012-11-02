module VideosHelper
  def embed vid
    video_html =<<-EOHTML.html_safe
      <div class='embed_container'>
        <iframe class='youtube_player' type='text/html' src='http://www.youtube.com/embed/#{vid.youtube_id}' frameborder =0>
        </iframe>
      </div>
EOHTML
  end
end
