class Location < ActiveRecord::Base
  has_many :practices, :dependent => :destroy
  
end
