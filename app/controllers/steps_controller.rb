class StepsController < ApplicationController
  respond_to :html, :json

  def show
  end

  def update
    @step = Step.find(params[:id])
    @step.update_attributes(params[:step])
    respond_with @recipe
  end

end