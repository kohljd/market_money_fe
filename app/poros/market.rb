class Market
  attr_reader :id,
              :name, 
              :street,
              :city, 
              :state,
              :zip

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:attributes][:name] 
    @street = attributes[:attributes][:street]
    @city = attributes[:attributes][:city] 
    @state = attributes[:attributes][:state]
    @zip = attributes[:attributes][:zip]
  end
end