class StepSummariesController < ApplicationController
respond_to :html, :json

  def update
    @step_summary = StepSummary.find(params[:id])
    @step_summary.update_attributes(params[:step_summary])
    respond_with @recipe
  end

  def create
    @user = current_user
    @step_summary = @user.step_summaries.build(params[:user])
    if @user.save
      flash[:success] = "Hee-Haw - Summary saved!"
      redirect_to @recipe
    else
      render '@recipe'
    end
  end
end
