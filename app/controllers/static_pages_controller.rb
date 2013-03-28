class StaticPagesController < ApplicationController
  def home
    if current_user
      @user = current_user
      @recipe = current_user.recipes.build
      @thought = current_user.thoughts.build
      @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.followed_users, owner_type: "User")
    else
      @user = User.new
    end
  end

  def about
  end
end
