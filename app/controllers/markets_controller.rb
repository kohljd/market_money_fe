class MarketsController < ActionController::Base
  def index
    @markets = MarketFacade.list_all_markets
  end
end