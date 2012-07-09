require 'spec_helper'

describe "UserPages" do
  
  subject { page }
  
  describe "new_user page" do
    before { visit new_user_path }
    
    it { should have_selector('h1', :text => "Add New User") }
    it { should have_selector('title', :text => full_title('Add new user')) }
  end
end
