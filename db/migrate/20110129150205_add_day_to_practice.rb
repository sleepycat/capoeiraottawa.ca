class AddDayToPractice < ActiveRecord::Migration
  def self.up
    add_column :practices, :day, :integer
  end

  def self.down
    remove_column :practices, :day
  end
end
