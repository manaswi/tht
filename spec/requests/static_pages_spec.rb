require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_selector('h1',    text: 'thoughts for food!') }
    it { should have_selector('title', text: 'ThotFood') }
    it { should_not have_selector 'title', text: 'Home|' }
  end

  describe "Home page for new/non signed in user" do
    before { visit root_path }

    it { should have_selector('h3',    text: 'sign in') }
    it { should have_selector('title', text: 'ThotFood') }
    it { should_not have_selector 'title', text: 'Home|' }
  end



  describe "About page" do
    before { visit about_path }

    it { should have_selector('h1', text: 'About ThotFood' ) }
    it { should have_selector('title', text: 'ThotFood|About') }
  end
end