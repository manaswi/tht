# == Schema Information
#
# Table name: step_summaries
#
#  id         :integer          not null, primary key
#  summary    :text
#  user_id    :string(255)
#  step_id    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StepSummary < ActiveRecord::Base
  attr_accessible :step_id, :summary, :user_id
  belongs_to :user
  belongs_to :step

end
