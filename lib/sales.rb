# lib/sales.rb
require_relative('../far_mar')

class FarMar::Sales
  # Your code goes here
  def initialize(id, amount, purchase_time, vendor_id, product_id)
  # Each sale belongs to a vendor AND a product. The vendor_id and product_id fields refer to the FarMar::Vendor and FarMar::Product ID fields, respectively. The FarMar::Sale data, in order in the CSV, consists of:
    @id = id
    @amount = amount
    @purchase_time = purchase_time
    @vendor_id = vendor_id
    @product_id = product_id
  end

end
