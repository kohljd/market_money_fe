require "rails_helper"

RSpec.describe "Visitor viewing a Market's Show", type: :feature do
  before do
    json_response_1 = File.read("spec/fixtures/market.json")
    @json_response_2 = File.read("spec/fixtures/vendors_for_a_market.json")
    
    stub_request(:get, "http://localhost:3000/api/v0/markets/322482")
      .to_return(status: 200, body: json_response_1)
    stub_request(:get, "http://localhost:3000/api/v0/markets/322482/vendors")
      .to_return(status: 200, body: @json_response_2)

    visit market_path(id: 322482)
  end

  describe "see the market's" do
    it "name" do
      expect(page).to have_content("39 North Marketplace")
    end

    it "address" do
      expect(page).to have_content("Downtown Sparks Victorian Ave\nSparks, Nevada 89431")
    end

    it "list of market vendors' names linking to their Show Page" do
      expect(page).to have_content("Vendors at our Market:")

      vendors = JSON.parse(@json_response_2, symbolize_names: true)[:data]
      vendors.each do |vendor|
        within "#vendor-#{vendor[:id]}" do
          expect(page).to have_link(vendor[:attributes][:name], href: vendor_path(id: vendor[:id]))
        end
      end
    end
  end
end