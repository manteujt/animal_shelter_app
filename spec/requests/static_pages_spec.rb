require 'spec_helper'

describe "StaticPages" do
  
  subject { page }
  
  describe "Home page" do
    before { visit root_path }
    
    it { should have_selector('h1', :text => 'GA Shelter') }
    it { should have_selector('title', :text => full_title('')) }
    it { should_not have_selector('title', :text => '| Home') }
  end
  
  describe "Help page" do
    before { visit help_path }
    
    it { should have_selector('h1', :text => 'Help') }
    it { should have_selector('title', :text => full_title('Help')) }
  end
  
  describe "About page" do
    before { visit about_path }
    
    it { should have_selector('h1', :text => 'About') }
    it { should have_selector('title', :text => full_title('About')) }
  end
  
  describe "Contact page" do
    before { visit contact_path }
    
    it { should have_selector('h1', :text => 'Contact') }
    it { should have_selector('title', :text => full_title('Contact')) }
  end
  
  describe "Employee page" do
    before { visit employee_path }
    
    it { should have_selector('h1', :text => 'Employee') }
    it { should have_selector('title', :text => full_title('Employee')) }
  end
  
  describe "Change_Password page" do
    before { visit change_password_path }
    
    it { should have_selector('h1', :text => 'Change Password') }
    it { should have_selector('title', :text => full_title('Change Password')) }
  end
  
  describe "Add_Employee page" do
    before { visit add_employee_path }
    
    it { should have_selector('h1', :text => 'Add Employee') }
    it { should have_selector('title', :text => full_title('Add Employee')) }
  end
end
