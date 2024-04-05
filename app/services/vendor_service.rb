class VendorService
  def self.get_vendor_info(vendor_id)
    get_url("/api/v0/vendors/#{vendor_id}")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "http://localhost:3000")
  end
end