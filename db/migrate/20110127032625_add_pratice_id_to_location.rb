class AddPraticeIdToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :practice_id, :integer
  end

  def self.down
    remove_column :locations, :practice_id
  end
end
