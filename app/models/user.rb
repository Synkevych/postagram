class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username
  validates_uniqueness_of :username
  attribute :role, :string, default: 'user'
  has_many :aticles
end
