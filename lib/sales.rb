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

  def vendor
    #vendor: returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
    # FarMar::Vendor instance
    vendor_id = self.vendor_id
    vendor = FarMar::Vendors.find(vendor_id)
    return vendor
  end
  def product
    #product: returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
    product_id = self.product_id
    product = FarMar::Products.find(product_id)
    return product
  end
  def self.between(beginning_time, end_time)
  # self.between(beginning_time, end_time): returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments
    sales = FarMar::Sales.all
    sale_times = []
    sales.each do |sale|
      if sale.purchase_time > beginning_time || sale.purchase_time == end_time
        sale_times << sale
      end
    end
    return sale_times
  end

end


# puts FarMar::Sales.all
# yes all them sales object print!

# how many products exist in collection?
# puts "Total sales: #{FarMar::Sales.all.count}"
# Total sales: 12798
# stil have no idea why 2 prints happen.
