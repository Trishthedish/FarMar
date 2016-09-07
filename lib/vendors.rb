# lib/vendors.rb
require_relative('../far_mar')


class FarMar::Vendors
  # Your code goes here

  def initialize(id, name, num_of_employees, market_id)
  # Each vendor belongs to a market, the [market_id] field refers to the FarMar::[Market ID] field. Each vendor has many products for sell. The data, in order in the CSV, consists of:
    @id = id
    @name = name
    @num_of_employees = num_of_employees
    @market_id = market_id

  end

end
