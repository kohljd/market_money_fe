require "rails_helper"

RSpec.describe "Visitor viewing a Vendor's Show", type: :feature do
  before do
    json_response = File.read("spec/fixtures/vendor.json")
    
    stub_request(:get, "http://localhost:3000/api/v0/vendors/56282")
      .to_return(status: 200, body: json_response)

    visit vendor_path(id: 56282)
  end

  describe "see the vendor's" do
    it "name" do
      expect(page).to have_content("Bookish Bazaar")
    end

    it "contact info" do
      expect(page).to have_content("name: Kanesha Rippin")
      expect(page).to have_content("phone: 1-223-658-3770")
    end

    it "description" do
      expect(page).to have_content("Description: A vibrant and colorful stall offering a diverse selection of books from around the world, as well as handmade bookmarks and reading accessories.")
    end
  end

  describe "see if vendor accepts credit" do
    context "vendor accepts credit" do
      it "displays 'YES' next to Credit Accepted?" do
        expect(page).to have_content("Credit Accepted?: YES")
      end
    end

    context "vendor does not accept credit" do
      it "displays 'NO' next to Credit Accepted?" do
        json_response = File.read("spec/fixtures/vendor_cash_only.json")
    
        stub_request(:get, "http://localhost:3000/api/v0/vendors/55340")
          .to_return(status: 200, body: json_response)
    
        visit vendor_path(id: 55340)

        expect(page).to have_content("Credit Accepted?: NO")
      end
    end
  end
end