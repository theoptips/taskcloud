class AddPasswordToUsers < ActiveRecord::Migration
  def change
    add_column :users, :encrypted_password, :string, :limit => 45
    add_column :users, :password_salt, :string, :limit => 45
  end
end
