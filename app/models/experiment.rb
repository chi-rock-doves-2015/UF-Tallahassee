class Experiment < ActiveRecord::Base
  belongs_to :researcher, class_name: "User", foreign_key: :researcher_id
  belongs_to :proposal
  has_many :comments, as: :commentable

  validates :title, :observations, presence: true
end
