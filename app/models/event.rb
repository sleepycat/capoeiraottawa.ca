class Event < ActiveRecord::Base

  geocoded_by :address, :latitude => :lat, :longitude => :lng
  after_validation :fetch_coordinates

  has_attached_file :poster,
                    :storage => :database,
                    :styles => {
                      :medium => { :geometry => "596x596>", :column => 'poster_medium_file'},
                      :thumb => { :geometry => "150x150>", :column => 'poster_thumb_file'}
                    },
                    :url => '/:class/:id/:attachment?style=:style'

  default_scope select_without_file_columns_for(:poster)
end
