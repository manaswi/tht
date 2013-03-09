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

require 'spec_helper'

describe StepIngredient do
  pending "add some examples to (or delete) #{__FILE__}"
end
