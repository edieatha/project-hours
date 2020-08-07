class Project < ApplicationRecord
  has_many :tasks
  belongs_to :user
  has_many :project_tasks

  validates :project_name, presence: true
end
