class ChangeBlobTypeOnEvents < ActiveRecord::Migration
  def self.up
   # change_column :events, :poster_file, :binary, :limit => 2.megabytes
  end

  def self.down
   # change_column :events, :poster_file, :binary
  end
end
