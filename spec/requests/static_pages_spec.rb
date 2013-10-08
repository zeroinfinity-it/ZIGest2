require 'spec_helper'

describe "StaticPages" do
  
	describe "Home page" do
	    it "Ci dovrebbe essere l'applicazione ZIGest come minimo..." do
	      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
	      visit '/static_pages/home'
	      expect(page).to have_content('ZIGest')
	    end
	    it "Manca il titolo Base?" do
	    	visit '/static_pages/home'
	    	expect(page).to have_title("ZeroInfinity ZIGest")
	    end
		it "Non ci dovrebbe essere un titolo custom" do
	    	visit '/static_pages/home'
	    	expect(page).not_to have_title("| Home")
	    end
	end

	describe "Help page" do
	
		it "Dovrebbe esserci il contenuto 'Help'" do
     		visit '/static_pages/help'
     		expect(page).to have_content('Help')
    	end

	end

	describe "Contact page" do
	
		it "Dovrebbe esserci il contenuto 'Contatti'" do
     		visit '/static_pages/help'
     		expect(page).to have_content('Contatti')
    	end

	end

end
