class RedefineLatLngForLocations < ActiveRecord::Migration
  def self.up
    change_column :locations, :lat, :decimal, :scale => 10, :precision => 15
    change_column :locations, :lng, :decimal, :scale => 10, :precision => 15
  end

  def self.down
    change_column :locations, :lat, :decimal
    change_column :locations, :lng, :decimal
  end
end
