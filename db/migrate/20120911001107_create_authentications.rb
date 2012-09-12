class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :uid
      t.integer :user_id
      t.string :provider
      t.timestamps
    end
  end
end
