class Location < ActiveRecord::Base
  has_many :practices, :dependent => :destroy

  #These methods are from the geocoder gem. 
  geocoded_by :address, :latitude => :lat, :longitude => :lng
  after_validation :fetch_coordinates

end
