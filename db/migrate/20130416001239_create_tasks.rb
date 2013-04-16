class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :user
      t.references :category
      t.string :title
      t.text :content
      t.integer :is_complete, :limit => 1
      t.integer :is_starred, :limit => 1
      t.string :thumbnail_url
      t.date :due_date
      t.integer :priority, :limit => 1

      t.timestamps
    end
    add_index :tasks, :user_id
    add_index :tasks, :category_id
  end
end
