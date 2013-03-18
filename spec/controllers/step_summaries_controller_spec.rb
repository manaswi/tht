require File.dirname(__FILE__) + '/../spec_helper'

describe StepSummariesController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => StepSummaries.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    StepSummaries.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    StepSummaries.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(step_summaries_url(assigns[:step_summaries]))
  end

  it "edit action should render edit template" do
    get :edit, :id => StepSummaries.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    StepSummaries.any_instance.stubs(:valid?).returns(false)
    put :update, :id => StepSummaries.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    StepSummaries.any_instance.stubs(:valid?).returns(true)
    put :update, :id => StepSummaries.first
    response.should redirect_to(step_summaries_url(assigns[:step_summaries]))
  end

  it "destroy action should destroy model and redirect to index action" do
    step_summaries = StepSummaries.first
    delete :destroy, :id => step_summaries
    response.should redirect_to(step_summaries_url)
    StepSummaries.exists?(step_summaries.id).should be_false
  end
end
