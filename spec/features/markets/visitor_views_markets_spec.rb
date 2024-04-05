require "rails_helper"

RSpec.describe "Visitor viewing Market Index", type: :feature do
  before do
    @json_response = File.read("spec/fixtures/markets_list.json")
    
    stub_request(:get, "http://localhost:3000/api/v0/markets")
      .to_return(status: 200, body: @json_response)

    visit markets_path
  end

  it "see 'Markets' heading" do
    expect(page).to have_content("Markets")
  end

  describe "see all markets listed in a table" do
    it "with their name, city, and state" do
      response = JSON.parse(@json_response, symbolize_names: true)
      markets = response[:data]
      
      markets.each do |market|
        attr = market[:attributes]
        expect(page).to have_content(attr[:name])
        expect(page).to have_content(attr[:city])
        expect(page).to have_content(attr[:state])
      end

      expect(page).to have_css(".market", count: 5)
    end

    it "with a button to see market's Show Page" do
      expect(page).to have_button("More Info", count: 5)

      response = JSON.parse(@json_response, symbolize_names: true)
      markets = response[:data]
      click_button "More Info", match: :first
      expect(current_path).to eq(market_path(markets[0][:id]))
    end
  end
end

# JSON.parse(File.read("spec/fixtures/markets_list.json"), symbolize_names: true)[:data]
# => [{:id=>"322458",
# :type=>"market",