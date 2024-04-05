class VendorsController < ActionController::Base
  def show
    @vendor = VendorFacade.vendor(params[:id])
  end
end