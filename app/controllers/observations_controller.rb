class ObservationsController < ApplicationController

  def new
    @observation = Observation.new
    render "new"
  end

  def create
    @experiment = Experiment.find_by(id: params[:experiment_id])
    @observation = Observation.new(observation_params)

    if @experiment.observations << @observation
      redirect_to experiment_path(@experiment)
    else
      @errors = @observation.errors.full_messages
      render "new"
    end
  end

  private

  def observation_params
    params.require(:observation).permit(:heading, :body)
  end

end
