class Vendor
  attr_reader :id,
              :name,
              :contact_name,
              :contact_phone,
              :credit_accepted,
              :description

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:attributes][:name]
    @contact_name = attributes[:attributes][:contact_name]
    @contact_phone = attributes[:attributes][:contact_phone]
    @credit_accepted = attributes[:attributes][:credit_accepted]
    @description = attributes[:attributes][:description]
  end
end