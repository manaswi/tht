class ThoughtsController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :create, :update, :destroy]
  load_and_authorize_resource
  respond_to :html, :json

  def index
    @user = current_user
    @thoughts = @user.thoughts
  end

  def new
    @user = current_user
    @thought = @user.thoughts.build
  end

  def create
    @user = current_user
    @thought = @user.thoughts.build(params[:thought])
    if @thought.save
      redirect_to root_url, :notice => "Successfully created thoughts."
      @thought.create_activity :create, owner: current_user
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @thought.update_attributes(params[:thoughts])
      redirect_to root_url, :notice  => "Successfully updated thoughts."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @thought.destroy
    redirect_to root_url, :notice => "Successfully destroyed thoughts."
  end
end
