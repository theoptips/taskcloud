class ChangeColumnSalt < ActiveRecord::Migration
  def up
  	change_column :users, :salt, :text
  end

  def down
  	change_column :users, :salt, :string
  end
end
