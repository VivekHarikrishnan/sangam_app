class AddPasswordHashAndPasswordSaltAndIsAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_hash, :string
    add_column :users, :password_salt, :string
    add_column :users, :is_admin, :boolean, default: false
  end
end
