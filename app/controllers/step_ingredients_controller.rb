class StepIngredientsController < ApplicationController
  respond_to :html, :json

  def update
    @step_ingredient = StepIngredient.find(params[:id])
    @step_ingredient.update_attributes(params[:step_ingredient])
    respond_with @recipe
  end

end