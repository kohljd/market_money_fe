require "rails_helper"

RSpec.describe MarketFacade do
  describe ".list_all_markets" do
    it "returns all Markets" do
      json_response = File.read("spec/fixtures/markets_list.json")
      
      stub_request(:get, "http://localhost:3000/api/v0/markets")
        .to_return(status: 200, body: json_response)

      markets = MarketFacade.list_all_markets
      
      expect(markets).to be_an(Array)
      expect(markets).to all(be_a(Market))
    end
  end

  describe ".market(market_id)" do
    it "returns one market's data given its id" do
      json_response = File.read("spec/fixtures/market.json")
      
      stub_request(:get, "http://localhost:3000/api/v0/markets/322482")
        .to_return(status: 200, body: json_response)

      market = MarketFacade.market(322482)
      
      expect(market).to be_a(Market)
    end
  end

  describe ".vendors_for_market(market_id)" do
    it "returns one market's data given its id" do
      json_response = File.read("spec/fixtures/vendors_for_a_market.json")
      
      stub_request(:get, "http://localhost:3000/api/v0/markets/322482/vendors")
        .to_return(status: 200, body: json_response)

      market_vendors = MarketFacade.vendors_for_market(322482)
      
      expect(market_vendors).to be_an(Array)
      expect(market_vendors).to all(be_a(Vendor))
    end
  end
end