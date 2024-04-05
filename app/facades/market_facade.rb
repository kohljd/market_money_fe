class MarketFacade
  def self.list_all_markets
    json = MarketService.get_all_markets
    json[:data].map do |market_data|
      Market.new(market_data)
    end
  end

  def self.market(market_id)
    json = MarketService.get_market_info(market_id)
    Market.new(json[:data])
  end

  def self.vendors_for_market(market_id)
    json = MarketService.get_vendors_for_market(market_id)
    json[:data].map do |market_vendor_data|
      Vendor.new(market_vendor_data)
    end
  end
end