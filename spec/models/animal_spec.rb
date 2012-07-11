require 'spec_helper'

describe Animal do
  before do
    @animal = Animal.new(:name => "Ellie", :description => "Cute terrier mix", :age => 1, :dog => true)
  end
  
  subject { @animal }
  
  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:age) }
  it { should respond_to(:dog) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @animal.name = " " }
    it { should_not be_valid }
  end
  
  describe "when name is not unique" do
    before do
      same_name = @animal.dup
      same_name.save
    end
    
    it { should_not be_valid }
  end
  
  describe "when description is not present" do
    before { @animal.description = " " }
    it { should_not be_valid }
  end
  
end
