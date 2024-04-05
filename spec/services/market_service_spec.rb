require "rails_helper"

RSpec.describe MarketService do
  describe ".get_all_markets" do
    it "returns all markets" do
      json_response = File.read("spec/fixtures/markets_list.json")
      
      stub_request(:get, "http://localhost:3000/api/v0/markets")
        .to_return(status: 200, body: json_response)

      markets = MarketService.get_all_markets

      expect(markets).to be_a(Hash)
      expect(markets[:data]).to be_an(Array)
      expect(markets[:data].size).to eq(5)
      expect(markets[:data]).to all(be_a(Hash))
      expect(markets[:data]).to all(include(type: "market"))
    end
  end

  describe ".get_market_info" do
    it "returns a market's data given market_id" do
      json_response = File.read("spec/fixtures/market.json")
      
      stub_request(:get, "http://localhost:3000/api/v0/markets/322482")
        .to_return(status: 200, body: json_response)

      market = MarketService.get_market_info(322482)

      expect(market).to be_a(Hash)
      expect(market[:data]).to be_an(Hash)
      expect(market[:data]).to be_a(Hash)
      expect(market[:data][:type]).to eq("market")
    end
  end

  describe ".get_vendors_for_a_market" do
    it "returns a market's vendors" do
      json_response = File.read("spec/fixtures/vendors_for_a_market.json")
      
      stub_request(:get, "http://localhost:3000/api/v0/markets/322482/vendors")
        .to_return(status: 200, body: json_response)

      market_vendors = MarketService.get_vendors_for_a_market(322482)

      expect(market_vendors).to be_a(Hash)
      expect(market_vendors[:data]).to be_an(Array)
      expect(market_vendors[:data].size).to eq(5)
      expect(market_vendors[:data]).to all(be_a(Hash))
      expect(market_vendors[:data]).to all(include(type: "vendor"))
    end
  end
end