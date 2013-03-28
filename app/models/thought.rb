# == Schema Information
#
# Table name: thoughts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Thought < ActiveRecord::Base
  attr_accessible :content, :user_id

  include PublicActivity::Common
  
  belongs_to :user
end
