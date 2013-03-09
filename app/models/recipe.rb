class Recipe < ActiveRecord::Base
  attr_accessible :title, :description, :uesr_id, :steps_attributes, :tag_list #, :label_tags_attributes
  acts_as_taggable_on :tags
  belongs_to :user
  has_many :steps, :dependent => :destroy
  has_many :step_ingredients, :through => :steps
  accepts_nested_attributes_for :steps,
          :reject_if => lambda { |a| a[:description].blank? },
          :allow_destroy => true
  #has_many :label_tags
  #has_many :labels, :through => :label_tags
  #accepts_nested_attributes_for :label_tags, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true

end
