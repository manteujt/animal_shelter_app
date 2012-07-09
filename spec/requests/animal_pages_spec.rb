require 'spec_helper'

describe "Animal Pages" do
  
  subject { page }
  
  describe "new_animal page" do
    before { visit new_animal_path }
    
    it { should have_selector('h1', :text => "New Animal") }
    it { should have_selector('title', :text => full_title('New animal')) }
  end
end