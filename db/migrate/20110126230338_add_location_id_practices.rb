class AddLocationIdPractices < ActiveRecord::Migration
  def self.up
    add_column :practices, :location_id, :integer
    remove_column :locations, :practice_id
  end

  def self.down
    add_column :locations, :practice_id, :integer
    remove_column :practices, :location_id
  end
end
