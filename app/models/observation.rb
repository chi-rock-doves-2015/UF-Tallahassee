class Observation < ActiveRecord::Base
  belongs_to :experiment

  validates :heading, :body, presence: true
end
