# == Schema Information
#
# Table name: steps
#
#  id          :integer          not null, primary key
#  step_no     :integer
#  description :text
#  summary     :text
#  recipe_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Step < ActiveRecord::Base
  attr_accessible :step_no, :description, :recipe_id, :step_ingredients_attributes
  default_scope order('step_no ASC')
  belongs_to :recipe
  has_many :step_ingredients
  has_many :ingredients, :through => :step_ingredients
  accepts_nested_attributes_for :step_ingredients,
          :reject_if => lambda { |a| a[:quantity].blank? },
          :allow_destroy => true
end
