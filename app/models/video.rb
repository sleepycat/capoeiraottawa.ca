class Video < ActiveRecord::Base
  translates :title, :description
  validates :youtube_id, :title, :duration, :uploader, :large_thumbnail, :small_thumbnail, :url, :presence => true
end
