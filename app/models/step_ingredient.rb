# == Schema Information
#
# Table name: step_ingredients
#
#  id         :integer          not null, primary key
#  quantity   :decimal(6, 2)
#  unit       :string(255)
#  ingredient :string(255)
#  step_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StepIngredient < ActiveRecord::Base
  attr_accessible :quantity, :step_id, :unit, :ingredient #s_attributes
  belongs_to :step
end
