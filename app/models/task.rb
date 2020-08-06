class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  validates :task_name, presence: true
  validates :task_hours, presence: true
end
