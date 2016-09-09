# lib/sales.rb
require_relative('../far_mar')

class FarMar::Sales
  # Your code goes here
  attr_reader :id, :amount, :product_id, :vendor_id, :purchase_time
  
  def initialize(id, amount, purchase_time, vendor_id, product_id)
  # Each sale belongs to a vendor AND a product. The vendor_id and product_id fields refer to the FarMar::Vendor and FarMar::Product ID fields, respectively. The FarMar::Sale data, in order in the CSV, consists of:
    @id = id
    @amount = amount
    @purchase_time = purchase_time
    @vendor_id = vendor_id
    @product_id = product_id
  end

  def self.all
    sales = CSV.read('./support/sales.csv')
    sales_array = []
    sales.each do |sale|
      id = sale[0]
      amount = sale[1]
      purchase_time = sale[2]
      vendor_id = sale[3]
      product_id = sale[4]
      sale = FarMar::Sales.new(id, amount, purchase_time, vendor_id, product_id)
      sales_array << sale
    end
    return sales_array
  end

  def self.find(id)
    sales = FarMar::Sales.all
    sales.each do |sale|
      if sale.id == id.to_s
        return sale
      end
    end
    puts "invalid, entry"
  end

end


# puts FarMar::Sales.all
# yes all them sales object print!

# how many products exist in collection?
# puts "Total sales: #{FarMar::Sales.all.count}"
# Total sales: 12798
# stil have no idea why 2 prints happen.
