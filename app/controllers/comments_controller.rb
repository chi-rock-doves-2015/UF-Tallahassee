class CommentsController < ApplicationController
    before_action :set_scope, only: [:index]
    before_action :set_commentable, only: [:new, :create]

  def index
    @comments = @scope.all
  end

  def new
    if session[:user_id]
      @comment = Comment.new
    else
      @errors = ["Your session has expired."]
      redirect_to login_path
    end
  end

  def create
    @comment = Comment.new(comment_params)
    @user = User.find_by(id: session[:user_id])

    if @commentable.comments << @comment && @user.comments << @comment
      redirect_to @parent || @commentable
    else
      @errors = @comment.errors.full_messages
      render "new"
    end
  end

  def edit
    @user = User.find(session[:user_id])
    @comment = @comment.find_by(id: params[:id])
    if @comment.author.id == session[:user_id]
      render "edit"
    else
      @errors = ["You must be the author of the comment to edit"]
      redirect_to :back
    end
  end

  def update
    @comment = Comment.find_by(id: params[:id])
    if @comment.update_attributes(comment_params)
      redirect_to @comment
    else
      @errors = @comment.errors.full_messages
      render "edit"
    end
  end

  def destroy
    @user = User.find_by(id: session[:user_id])
    if @comment = @user.comments.find_by(id: params[:id])
      @comment.destroy
    end
    redirect_to user_posts_path(@user)
  end

  protected

  def set_scope
    @scope ||= params[:user_id] ? Comment.where(author: params[:user_id]) : Comment
  end

  def set_commentable
    @commentable =  if params[:proposal_id]
                      @redirect_to = Proposal.find_by(id: params[:proposal_id])
                    elsif params[:experiment_id]
                      @redirect_to = Experiment.find_by(id: params[:experiment_id])
                    else
                      comment = Comment.find_by(id: params[:comment_id])
                      @redirect_to = comment.commentable
                      comment
                    end
  end

  def set_redirect
    @redirect_path = if params[:proposal_id]
      proposal_path(params[:proposal_id])
    elsif params[:experiment_id]
      experiment_path(params[:experiment_id])
    else
    end
  end
  @commentable.path
  # def commentable_path(commentable)
  #   if commentable
  #     Proposal.find_by(id: params[:post_id])
  #   else
  #     Comment.find_by(id: params[:comment_id])
  #   end
  # end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end


end

