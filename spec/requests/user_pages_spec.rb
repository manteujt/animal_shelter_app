require 'spec_helper'

describe "UserPages" do
  
  subject { page }
  
  describe "new_user page" do
    before { visit new_user_path }
    
    it { should have_selector('h1', :text => "Add New User") }
    it { should have_selector('title', :text => full_title('Add new user')) }
  end
  
  describe "create new user" do
    before { visit new_user_path }
    
    let (:submit) { "Create account" }
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count) 
      end
    end
    
    describe "with valid information" do
      before do
        fill_in "Name", :with => "Example User"
        fill_in "Username", :with => "user"
      end
      
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      describe "check links" do
        before { click_link("Home") }
        
        it { should have_selector("li", :text => "New Animal") }
      end
    end
  end
end
