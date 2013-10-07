require 'spec_helper'

describe "StaticPages" do
  describe "GET /static_pages" do
    it "Ci dovrebbe essere l'applicazione ZIGest come minimo..." do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/static_pages/home'
      expect(page).to have_content('ZIGest2')
    end
  end
end
