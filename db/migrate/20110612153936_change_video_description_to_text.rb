class ChangeVideoDescriptionToText < ActiveRecord::Migration
  def self.up
    Video.drop_translation_table!
    change_column :videos, :description, :text
    Video.create_translation_table! :title => :string, :description => :text
  end

  def self.down
    Video.drop_translation_table!
    change_column :videos, :description, :string 
    Video.create_translation_table! :title => :string, :description => :string
  end
end
