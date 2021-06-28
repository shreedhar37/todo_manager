class User < ActiveRecord::Base
  validates :first_name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8 }
  has_secure_password
  has_many :todos
end
