# == Schema Information
#
# Table name: relations
#
#  id           :integer          not null, primary key
#  follower_id  :integer
#  followed_id  :integer
#  followed_obj :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Relation < ActiveRecord::Base
  attr_accessible :followed_id, :followed_obj

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true
end
