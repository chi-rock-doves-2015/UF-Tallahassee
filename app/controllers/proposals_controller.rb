class ProposalsController < ApplicationController
  before_action :set_scope, only: [:index]
  # before_action :set_scope, only: [:index, :edit, :show]

  def index
    @proposals = @scope.all
    render "index"
  end

  def new
    if session[:user_id]
      @proposal = Proposal.new
      render "new"
    else
      @errors = ["You must be signed in to create a proposal"]
      redirect_to :back
    end
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @user = User.find_by(id: session[:user_id])

    if @user.proposals << @proposal
      redirect_to @proposal
    else
      @errors = @proposal.errors.full_messages
      render "new"
    end
  end

  def show
    @proposal = Proposal.find_by(id: params[:id])
  end

  def edit
    @user = User.find(session[:user_id])
    @proposal = Proposal.find(params[:id])
    if @proposal.faculty.id == session[:user_id]
      render "edit"
    else
      @errors = ["You must be the author of the proposal to edit"]
      redirect_to :back
    end
  end

  def update
    @proposal = Proposal.find(params[:id])
    if @proposal.update_attributes(proposal_params)
      redirect_to @proposal
    else
      @errors = @proposal.errors.full_messages
      render "edit"
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @proposal = Proposal.find(params[:id])
    # puts @user.id == @proposal.faculty.id
    @proposal.destroy if @user.id == @post.faculty.id
    redirect_to user_proposals_path(@user)
  end

  protected

  def set_scope
    @scope ||= params[:user_id] ? Proposal.where(faculty: params[:user_id]) : Proposal
  end

  private

    def proposal_params
      params.require(:proposal).permit(:title, :hypothesis, :background, :faculty)
    end

end

