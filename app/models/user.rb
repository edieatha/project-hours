class User < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_one_attached :image
  before_save { self.username = username.downcase }
  validates :username, uniqueness: true, presence: true
end
