class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :author, class_name: "User"
  has_many :comments, class_name: "Comment", as: :commentable

  validates :body, presence: true

  def ancestry(ancestor = self.commentable)
    if ancestor.is_a?(Proposal) || ancestor.is_a?(Experiment)
      return ancestor
    else
      ancestry(ancestor.commentable)
    end
  end

end


