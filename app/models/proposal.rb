class Proposal < ActiveRecord::Base
  belongs_to :faculty, class_name: "User", foreign_key: :faculty_id
  has_many :experiments
  has_many :comments, as: :commentable

  validates :title, :hypothesis presence: true
end
