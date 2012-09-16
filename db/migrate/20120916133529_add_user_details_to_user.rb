class AddUserDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :image, :text
    add_column :users, :website, :string
  end
end
