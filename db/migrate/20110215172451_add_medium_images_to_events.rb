class AddMediumImagesToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :poster_medium_file, :binary, :limit => 1.megabyte
  end

  def self.down
    remove_column :events, :poster_medium_file
  end
end
