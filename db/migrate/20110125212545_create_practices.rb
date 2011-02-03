class CreatePractices < ActiveRecord::Migration
  def self.up
    create_table :practices do |t|
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :practices
  end
end
