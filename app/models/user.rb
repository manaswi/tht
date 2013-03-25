# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base 
  attr_accessible :username, :email, :password, :password_confirmation, :step_summaries_attributes

  has_secure_password
  has_many :recipes
  has_many :step_summaries
  has_many :steps, through: :step_summaries
  has_many :comments

  has_many :relations, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relations, source: :followed

  has_many :reverse_relations, foreign_key: "followed_id",
                                   class_name:  "Relation",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relations, source: :follower


  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  validates :username, presence: true, length: { maximum: 50 },
          uniqueness: { case_sensitive: false }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
           format: { with: VALID_EMAIL_REGEX },
           uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  def following?(other_user)
    relations.find_by_followed_id(other_user.id)
  end

  def follow!(other_user, obj)
    relations.create!(followed_id: other_user.id, followed_obj: obj)
  end

  def unfollow!(other_user)
    relations.find_by_followed_id(other_user.id).destroy
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

end
