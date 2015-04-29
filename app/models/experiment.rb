class Experiment < ActiveRecord::Base
  has_many :comments, as: :commentable
  # belongs_to :
end