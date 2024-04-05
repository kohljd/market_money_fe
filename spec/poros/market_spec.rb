require "rails_helper"

RSpec.describe Market do
  it "creates Market object from parsed JSON data" do
    data = {
          id:"322500",
          type:"market",
          attributes:{
            name:"9th and Grand Farmers Market", 
            street:"304 West Grand Avenue", 
            city:"Salina", 
            county:"Saline", 
            state:"Kansas", 
            zip:"67401", 
            lat:"38.8528359", 
            lon:"-97.6117504", 
            vendor_count:6
          }
        }

    market = Market.new(data)

    expect(market).to be_a(Market)
    expect(market.id).to eq("322500")
    expect(market.name).to eq("9th and Grand Farmers Market")
    expect(market.street).to eq("304 West Grand Avenue")
    expect(market.city).to eq("Salina")
    expect(market.state).to eq("Kansas")
    expect(market.zip).to eq("67401")
  end
end