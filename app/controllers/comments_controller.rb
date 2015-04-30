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
      redirect_to @comment.ancestry
    else
      @errors = @comment.errors.full_messages
      render "new"
    end
  end

  def edit
    @user = User.find(session[:user_id])
    @comment = Comment.find_by(id: params[:id])
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
      redirect_to @comment.ancestry
    else
      @errors = @comment.errors.full_messages
      render "edit"
    end
  end

  def destroy
    @user = User.find_by(id: session[:user_id])
    if @comment = @user.comments.find_by(id: params[:id])
      ancestry = @comment.ancestry
      @comment.destroy
    end

    redirect_to ancestry
  end

  protected

  def set_scope
    @scope ||= params[:user_id] ? Comment.where(author: params[:user_id]) : Comment
  end

  def set_commentable
    @commentable =  if params[:proposal_id]
                      Proposal.find_by(id: params[:proposal_id])
                    elsif params[:experiment_id]
                      Experiment.find_by(id: params[:experiment_id])
                    else
                      Comment.find_by(id: params[:comment_id])
                    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end


end

