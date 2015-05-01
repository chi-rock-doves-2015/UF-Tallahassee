class User < ActiveRecord::Base
  has_many :proposals, foreign_key: :faculty_id
  has_many :experiments, foreign_key: :researcher_id
  has_many :comments, foreign_key: :author_id

  enum role: [ :faculty, :researcher ]

  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, uniqueness: true, presence: true, format: { with: /.+(@uft.edu)/, message: "must be registered with UFT" }

  has_secure_password

  acts_as_taggable_on :favorite
end
