class Event < ActiveRecord::Base

  geocoded_by :address, :latitude => :lat, :longitude => :lng
  before_validation :fetch_coordinates

  @sftp_credentials = {Rails.env.to_sym => { 
    :sftp_host => ENV['SFTP_HOST'],
    :sftp_user => ENV['SFTP_USER'],
    :sftp_password => ENV['SFTP_PASSWORD']
    }}

  #XXX -- gsub filenames before saving to remove blank spaces. Replace with %20. 
  has_attached_file :poster, :storage => :sftp, :path => 'paperclipcache.com/capoeiraottawa.ca/:class/:style/:basename.:extension', :url => 'http://paperclipcache.com/capoeiraottawa.ca/:class/:style/:basename.:extension', :sftp_credentials => @sftp_credentials, :styles => { :medium => { :geometry => "596x596>"}, :thumb => { :geometry => "150x150>" }}

  validates_presence_of :lng, :message => I18n.t('validations.event.empty_lat_lng')
end
