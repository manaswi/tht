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

require 'spec_helper'

describe StepSummary do
  pending "add some examples to (or delete) #{__FILE__}"
end
