class MarketFacade
  def self.list_all_markets
    json = MarketService.get_all_markets
    json[:data].map do |market_data|
      Market.new(market_data)
    end
  end
end