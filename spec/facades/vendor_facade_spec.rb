require "rails_helper"

RSpec.describe VendorFacade do
  describe ".vendor(vendor_id)" do
    it "returns one vendor's data given its id" do
      json_response = File.read("spec/fixtures/vendor.json")
      
      stub_request(:get, "http://localhost:3000/api/v0/vendors/322482")
        .to_return(status: 200, body: json_response)

      vendor = VendorFacade.vendor(322482)
      
      expect(vendor).to be_a(Vendor)
    end
  end
end