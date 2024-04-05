class MarketService
  def self.get_all_markets
    get_url("/api/v0/markets")
  end

  def self.get_market_info(market_id)
    get_url("/api/v0/markets/#{market_id}")
  end

  def self.get_vendors_for_a_market(market_id)
    get_url("/api/v0/markets/#{market_id}/vendors")
  end

  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "http://localhost:3000")
  end
end