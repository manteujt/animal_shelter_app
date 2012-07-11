require 'spec_helper'

describe "Animal Pages" do
  
  subject { page }
  
  describe "new_animal page" do
    before { visit new_animal_path }
    
    it { should have_selector('h1', :text => "Add an Animal") }
    it { should have_selector('title', :text => full_title('Add an Animal')) }
  end
  
  describe "profile page" do
    let(:animal) { FactoryGirl.create(:animal) }
    before { visit animal_path(animal) }
    
    it { should have_selector('h1', :text => animal.name) }
    it { should have_selector('title', :text => animal.name) }
  end
end