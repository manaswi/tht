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
