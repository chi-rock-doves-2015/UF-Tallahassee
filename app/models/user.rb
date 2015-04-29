class User < ActiveRecord::Base
  has_many :proposals
  has_many :experiments
  has_many :comments

  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /.+[@uft.edu]/, message: "invalid email" }
  validates :email, uniqueness: true, presence: true

  has_secure_password
end
