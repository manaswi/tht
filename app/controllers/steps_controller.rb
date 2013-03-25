class StepsController < ApplicationController
  respond_to :html, :json

  def show
  end

  def update
    @step = Step.find(params[:id])
    @step.update_attributes(params[:step])
    @step.create_activity :update, owner: current_user
    #respond_with @recipe
    render :json => @recipe, :status => :ok
  end

end