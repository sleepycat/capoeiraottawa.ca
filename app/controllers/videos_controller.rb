class VideosController < ApplicationController
  def index
    playlist = Youtube::Playlist.new('76E01802262A6694')
    @videos = playlist.videos(5)
  end
end
