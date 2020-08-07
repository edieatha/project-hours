class Task < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :project_tasks
  validates :task_name, presence: true
  validates :task_hours, presence: true
end
