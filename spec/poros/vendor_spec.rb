require "rails_helper"

RSpec.describe Vendor do
  it "creates Vendor object from parsed JSON data" do
    data = {
      id:"56282",
      type:"vendor",
      attributes:{
        name:"Bookish Bazaar", 
        description: "A vibrant and colorful stall offering a diverse selection of books from around the world, as well as handmade bookmarks and reading accessories.",
        contact_name: "Kanesha Rippin",
        contact_phone: "1-223-658-3770",
        credit_accepted: true
      }
    }

    vendor = Vendor.new(data)

    expect(vendor).to be_a(Vendor)
    expect(vendor.id).to eq("56282")
    expect(vendor.name).to eq("Bookish Bazaar")
    expect(vendor.description).to eq("A vibrant and colorful stall offering a diverse selection of books from around the world, as well as handmade bookmarks and reading accessories.")
    expect(vendor.contact_name).to eq("Kanesha Rippin")
    expect(vendor.contact_phone).to eq("1-223-658-3770")
    expect(vendor.credit_accepted).to eq(true)
  end
end