require 'spec_helper'

describe "UserPages" do

  subject { page }
  
  describe "signup page" do
    
    before { visit signup_path }

    it  { should have_content('Sign up')} 
    it { should have_title(full_title('Sign up')) }

  end
end

describe User do

  before do
    @user = User.new(nome: "Nome User", cognome: "Cognome User", email: "user@example.com")
  end

  subject { @user }

  it { should respond_to(:nome) }
  it { should respond_to(:cognome) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
end

