require "rails_helper"

RSpec.describe MarketService do
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