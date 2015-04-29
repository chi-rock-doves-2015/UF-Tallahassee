class User < ActiveRecord::Base
  has_many :proposals, foreign_key: :faculty_id
  has_many :experiments, foreign_key: :researcher_id
  has_many :comments, foreign_key: :author_id

  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }, format: { with: /.+[@uft.edu]/, message: "invalid email" }
  validates :email, uniqueness: true, presence: true

  has_secure_password
end
