class Project < ApplicationRecord
  belongs_to :user
  has_many :project_tasks
  has_many :tasks, -> { distinct }, through: :project_tasks, dependent: :destroy

  validates :project_name, presence: true
end
