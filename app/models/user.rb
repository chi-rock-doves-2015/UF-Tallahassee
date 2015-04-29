class User < ActiveRecord::Base
  has_many :proposals
  has_many :experiments
  has_many :comments

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, length: { minimun: 6 }

  has_secure_password
end
