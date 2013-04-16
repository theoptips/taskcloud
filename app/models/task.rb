class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  attr_accessible :content, :due_date, :is_complete, :is_starred, :priority, :thumbnail_url, :title, :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/images/rails.png"
end
