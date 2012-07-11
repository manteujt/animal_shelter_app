require 'spec_helper'

describe User do
  
  before do
    @user = User.new(:name => "Example User", :username => "user", 
                    :password => "foobar", :password_confirmation => "foobar")
  end
  
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:username) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  
  describe "when username is not present" do
    before { @user.username = " " }
    it { should_not be_valid }
  end
  
  describe "when username is not unique" do
    before do
      same_username = @user.dup
      same_username.save
    end
    
    it { should_not be_valid }
  end
  
#  describe "when password is not present" do
#    before { @user.password = @user.password_confirmation = " " }
#    it { should_not be_valid }
#  end
  
#  describe "when password confirmation is nil" do
#    before { @user.password_confirmation = nil }
#    it { should_not be_valid }
#  end
  
#  describe "when password doesn't match confirmation" do
#    before { @user.password_confirmation = "mismatch" }
#    it { should_not be_valid }
#  end
  
#  describe "with a password that's too short" do
#    before { @user.password = @user.password_confirmation = "a" * 5 }
#    it { should be_invalid }
  #end
  
  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_username(@user.username) }
    
    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end
    
    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }
      
      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
end
