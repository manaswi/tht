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

  include PublicActivity::Common
  
  attr_accessible :step_no, :description, :recipe_id, :step_ingredients_attributes,
           :step_summaries_attributes
  default_scope order('step_no ASC')
  belongs_to :recipe
  has_many :step_ingredients
  has_many :step_summaries
  has_many :users, through: :step_summaries

  accepts_nested_attributes_for :step_summaries,
          :reject_if => lambda { |a| a[:quantity].blank? },
          :allow_destroy => true

  accepts_nested_attributes_for :step_ingredients,
          :reject_if => lambda { |a| a[:quantity].blank? },
          :allow_destroy => true

  validates :step_no, presence: true, :numericality => { :greater_than_or_equal_to => 1 }


end
