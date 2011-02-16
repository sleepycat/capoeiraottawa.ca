class AddMediumImagesToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :poster_medium_file, :binary
  end

  def self.down
    remove_column :events, :poster_medium_file
  end
end
