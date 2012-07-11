require 'spec_helper'

describe "Authentication" do
  
 subject { page }
 
 describe "signin page" do
   before { visit new_session_path }
   
    it { should have_selector('h1', :text => 'Employee Sign In') }
    it { should have_selector('title', :text => 'Employee Sign In') }
   
   describe "with invalid information" do
     before { click_button "Sign In" }
     
     it { should have_selector('title', :text => 'Employee Sign In') }
     it { should have_selector('div.alert.alert-error', :text => 'Invalid') }
     
     describe "after visiting another page" do
       before { click_link "Home" }
       it { should_not have_selector('div.alert.alert-error', :text => 'Invalid') }
     end
   end
   
   describe "with valid information" do
     let (:user) { FactoryGirl.create(:user) }
     before do
       fill_in "Username", :with => user.username
       fill_in "Password", :with => user.password
       click_button "Sign In"
     end
     
     it { should have_selector('h1', :text => "Add an Animal") }
   end
 end
end
