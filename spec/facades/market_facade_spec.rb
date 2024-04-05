require "rails_helper"

RSpec.describe MarketFacade do
  it "returns all Markets" do
    json_response = File.read("spec/fixtures/markets_list.json")
    
    stub_request(:get, "http://localhost:3000/api/v0/markets")
      .to_return(status: 200, body: json_response)

    markets = MarketFacade.list_all_markets
    
    expect(markets).to be_an(Array)
    expect(markets).to all(be_a(Market))
  end
end