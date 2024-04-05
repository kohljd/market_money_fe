class VendorFacade
  def self.vendor(vendor_id)
    json = VendorService.get_vendor_info(vendor_id)
    Vendor.new(json[:data])
  end
end