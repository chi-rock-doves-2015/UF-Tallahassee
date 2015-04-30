class Proposal < ActiveRecord::Base
  belongs_to :faculty, class_name: "User"
  has_many :experiments
  has_many :comments, as: :commentable

  validates :title, :hypothesis, presence: true

  # def time_since_creation
  #   ((Time.now - created_at) / 3600).round
  # end

end
