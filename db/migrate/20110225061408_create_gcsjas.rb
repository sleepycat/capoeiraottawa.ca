class CreateGcsjas < ActiveRecord::Migration
  def self.up
    create_table :gcsjas do |t|
      t.text :about
      t.text :welcome

      t.timestamps
    end
  end

  def self.down
    drop_table :gcsjas
  end
end
