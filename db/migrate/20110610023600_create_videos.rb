class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.string :url
      t.string :youtube_id
      t.string :small_thumbnail
      t.string :large_thumbnail
      t.string :uploader
      t.string :duration
      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
