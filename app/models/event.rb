class Event < ActiveRecord::Base

  geocoded_by :address, :latitude => :lat, :longitude => :lng
  before_validation :fetch_coordinates


  has_attached_file :poster, :storage => :sftp, :path => 'paperclipcache.com/capoeiraottawa.ca/:class/:style/:basename.:extension', :url => 'http://paperclipcache.com/capoeiraottawa.ca/:class/:style/:basename.:extension', :sftp_credentials => Rails.root.join("config", "sftp.yml").to_s, :styles => { :medium => { :geometry => "596x596>"}, :thumb => { :geometry => "150x150>" }}

  validates_presence_of :lng, :message => I18n.t('validations.event.empty_lat_lng')
end
