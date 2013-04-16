class AddAttachmentAvatarToTasks < ActiveRecord::Migration
  def self.up
    change_table :tasks do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :tasks, :avatar
  end
end
