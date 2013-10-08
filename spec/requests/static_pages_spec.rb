require 'spec_helper'

describe "StaticPages" do
	subject { page }
  
	describe "Home page" do
		before { visit root_path }

		it { should have_content('ZIGest') }
    	it { should have_title(full_title('ZeroInfinity ZIGest')) }
    	it { should_not have_title('| Home') }
	end

	describe "Help page" do
	
		before { visit help_path }

    	it { should have_content('Help') }
    	it { should have_title(full_title('Help')) }
	end

	describe "Contact page" do
	
		before { visit help_path }

    	it { should have_content('Contatti') }
    	it { should have_title(full_title('Contatti')) }

	end

end
