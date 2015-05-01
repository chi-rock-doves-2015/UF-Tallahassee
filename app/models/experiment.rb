class Experiment < ActiveRecord::Base
  include AASM
  belongs_to :researcher, class_name: "User"
  belongs_to :proposal
  has_many :comments, as: :commentable
  has_many :observations

  validates :title, :summary, presence: true

  aasm column: 'status' do
    state :pending, initial: true
    state :running
    state :completed

    event :run do
      transitions from: :pending, to: :running
      puts 'running experiment'
    end

    event :complete do
      transitions from: :running, to: :completed
      puts 'experiment completed'
    end
  end



end
