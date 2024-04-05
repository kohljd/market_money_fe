require "rails_helper"

RSpec.describe VendorService do
  describe ".get_vendor_info" do
    it "returns a vendor's data given vendor_id" do
      json_response = File.read("spec/fixtures/vendor.json")
      
      stub_request(:get, "http://localhost:3000/api/v0/vendors/322482")
        .to_return(status: 200, body: json_response)

      vendor = VendorService.get_vendor_info(322482)

      expect(vendor).to be_a(Hash)
      expect(vendor[:data]).to be_a(Hash)
      expect(vendor[:data][:type]).to eq("vendor")
    end
  end
end