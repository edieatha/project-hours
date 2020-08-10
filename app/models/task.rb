class Task < ApplicationRecord
  belongs_to :user
  has_many :project_tasks
  has_many :projects, -> { distinct }, through: :project_tasks
  validates :task_name, presence: true
  validates :task_hours, presence: true

  default_scope { order(created_at: :desc) }
  scope :no_project, -> { where(project_id: nil) }

  def self.projects(user)
    where('task = ? AND project_ids = ?', user)
  end
end
