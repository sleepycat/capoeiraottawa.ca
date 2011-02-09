class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.decimal :lat
      t.decimal :lng
      t.string :address
      t.date :start_date
      t.time :start_time
      t.string :title
      t.binary :poster_file
      t.binary :poster_thumb_file
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
