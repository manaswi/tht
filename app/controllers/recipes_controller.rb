class RecipesController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :create, :update]
  load_and_authorize_resource
  autocomplete :tag, :name, :full => true, :class_name => 'ActsAsTaggableOn::Tag'
  #autocomplete :step_ingredient, :ingredient, :full => true#, :class_name => 'ActsAsTaggableOn::Tag'
  respond_to :html, :json
  
  def index
    if params[:tag]
      @user = current_user
      @recipes = Recipe.tagged_with(params[:tag])
      @allrecipes = Recipe.tagged_with(params[:tag]).where('user_id != ?', current_user.id)
    else
      @user = current_user
      @recipes = @user.recipes
      @allrecipes = Recipe.where('user_id != ?', current_user.id)
    end
  end

  def show
  end

  def edit
  end

  def new
    @user = current_user
    @recipe = @user.recipes.build
    1.times do
      step = @recipe.steps.build
      1.times { step.step_ingredients.build }
    end
  end

  def create
    @user = current_user
    @recipe = @user.recipes.build(params[:recipe])
    if @recipe.save
      flash[:success] = "Hee-Haw - Recipe created, now go make the dish!"
      redirect_to @recipe
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to(@recipe, :notice => 'Recipe was successfully updated.') }
        format.json { respond_with_bip(@recipe) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@recipe) }
      end
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_url, :notice => "Successfully destroyed recipe."
  end

  private

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

end
