class ExperimentsController < ApplicationController
  before_action :set_scope, only: [:index]
  # before_action :set_scope, only: [:index, :edit, :show]

  def index
    @experiments = @scope.all
    render "index"
  end

  def new
    if session[:user_id]
      @experiment = Experiment.new
      render "new"
    else
      @errors = ["You must be signed in to create an experiment."]
      redirect_to :back
    end
  end

  def create
    @experiment = Experiment.new(experiment_params)
    @user = User.find_by(id: session[:user_id])
    @proposal = Proposal.find_by(id: params[:proposal_id])
    if @user.experiments << @experiment && @proposal.experiments << @experiment
      update_state
      redirect_to @experiment
    else
      @errors = @experiment.errors.full_messages
      render "new"
    end
  end

  def show
    @experiment = Experiment.find_by(id: params[:id])
  end

  def edit
    @experiment = Experiment.find(params[:id])
    if @experiment.researcher == current_user
      render "edit"
    else
      flash[:alert] = "You must be the researcher on this experiment to edit."
      redirect_to :back
    end
  end

  def update
    @experiment = Experiment.find(params[:id])
    if @experiment.update_attributes(experiment_params)
      update_state
      redirect_to @experiment
    else
      @errors = @experiment.errors.full_messages
      render "edit"
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    @experiment = Experiment.find(params[:id])
    # puts @user.id == @experiment.researcher.id
    @experiment.destroy if @user.id == @experiment.researcher.id
    redirect_to user_experiments_path(@user)
  end

  def edit_methodology
    @experiment = Experiment.find(params[:id])
    if @experiment.researcher == current_user
      render partial: "add_methodology"
    else
      flash[:alert] = "You must be the researcher on this experiment to edit."
      redirect_to :back
    end
  end

  protected

  def update_state
    @experiment.run! if @experiment.pending? && @experiment.methodology
    @experiment.complete! if @experiment.running? && @experiment.conclusion
  end


  def set_scope
    @scope ||= params[:user_id] ? Experiment.where(researcher: params[:user_id]) : Experiment
  end

  private

    def experiment_params
      params.require(:experiment).permit(:title, :methodology, :summary, :conclusion)
    end

end


