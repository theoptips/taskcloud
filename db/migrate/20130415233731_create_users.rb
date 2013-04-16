class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :limit => 45
      t.string :last_name, :limit => 45
      t.string :email
      t.string :password, :limit => 45
      
      t.timestamps
    end
  end
end
