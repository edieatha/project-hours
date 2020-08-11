class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy

  before_save { self.username = username.downcase }
  validates :username, uniqueness: true, presence: true
end
