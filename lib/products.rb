# lib/products.rb
require_relative('../far_mar')

class FarMar::Products
  # Your code goes here
  def initialize(id, name, vendor_id)
  # Each product belongs to a vendor. The vendor_id field refers to the FarMar::Vendor ID field. The FarMar::Product data, in order in the CSV, consists of:
    @id = id
    @name = name
    @vendor_id = vendor_id
  end

end
