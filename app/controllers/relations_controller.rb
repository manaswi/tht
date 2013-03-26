class RelationsController < ApplicationController
  before_filter :signed_in_user

  def create
    @user = User.find(params[:relation][:followed_id])
    @obj = params[:relation][:followed_obj]
    current_user.follow!(@user, @obj)
    current_user.create_activity action: 'follow', params: {id: @user.id}, recipient: @user, owner: current_user
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relation.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end