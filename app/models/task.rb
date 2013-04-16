class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  attr_accessible :content, :due_date, :is_complete, :is_starred, :priority, :thumbnail_url, :title
end
