class AddTranslationTableForVideos < ActiveRecord::Migration
  def self.up
    Video.create_translation_table! :title => :string, :description => :string
  end

  def self.down
    Video.drop_translation_table!
  end
end
