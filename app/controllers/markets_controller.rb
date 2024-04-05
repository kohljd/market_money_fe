class MarketsController < ActionController::Base
  def index
    @markets = MarketFacade.list_all_markets
  end

  def show
    market_id = params[:id]
    @market = MarketFacade.market(market_id)
    @vendors = MarketFacade.vendors_for_market(market_id)
  end
end