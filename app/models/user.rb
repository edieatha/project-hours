class User < ApplicationRecord
  before_save { self.username = username.downcase }
  validates :username, uniqueness: true, presence: true
end
