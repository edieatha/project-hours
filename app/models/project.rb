class Project < ApplicationRecord
  has_many :tasks, -> { distinct }, through: :project_tasks, dependent: :destroy
  belongs_to :user
  has_many :project_tasks

  validates :project_name, presence: true
end
