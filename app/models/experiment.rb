class Experiment < ActiveRecord::Base
  belongs_to :researcher, class_name: "User"
  belongs_to :proposal
  has_many :comments, as: :commentable

  validates :title, :observations, presence: true
end
