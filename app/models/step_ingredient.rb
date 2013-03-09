class StepIngredient < ActiveRecord::Base
  attr_accessible :quantity, :step_id, :unit, :ingredient #s_attributes
  belongs_to :step
end
