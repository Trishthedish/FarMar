# lib/vendors.rb
# require_relative('./markets.rb')
# require_relative('../lib/products.rb')
# require_relative('../lib/sales.rb')
require_relative('../far_mar')
# require_relative('./markets.rb')
# require_relative('./markets.rb')
# require_relative('./products.rb')
# require_relative('./sales.rb')


# ruby lib/vendors.rb

class FarMar::Vendors
  # Your code goes here
  attr_reader :id, :name, :market_id, :num_of_employees

  def initialize(id, name, num_of_employees, market_id)
  # Each vendor belongs to a market, the [market_id] field refers to the FarMar::[Market ID] field. Each vendor has many products for sell. The data, in order in the CSV, consists of:
    @id = id
    @name = name
    @num_of_employees = num_of_employees
    @market_id = market_id
  end

# output: return a collection of instances of the vendor object.
  def self.all
    # THESE DOTS ARE RIDIC!!
    vendors = CSV.read('./support/vendors.csv')
    vendors_array = []

    vendors.each do |vendor|
      id = vendor[0]
      name = vendor[1]
      num_of_employees = vendor[2]
      market_id = vendor[3]
      vendor = FarMar::Vendors.new(id, name, num_of_employees, market_id)
      vendors_array << vendor
    end
    return vendors_array
  end

  def self.find(id)
    vendors = FarMar::Vendors.all
    vendors.each do |vendor|
      if vendor.id == id.to_s
        return vendor
      end
    end
    puts "Invalid entry, vendor id doesn't match."
  end

  def market
    #1 #market: returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
    market_id = self.market_id
    market = FarMar::Markets.find(market_id)
    return market
    # self.market_id
    #the market_id of vendor.
  end

  def products
    #products: returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
    products = FarMar::Products.all
      products_array = []
      products.each do |product|
        if product.vendor_id == id
          products_array << product
        end
      end
      return products_array
  end

  def sales
    #sales: returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
    sales = FarMar::Sales.all
    sales_array  = []
    sales.each do |sale|
      if sale.vendor_id == id
        sales_array << sale
      end
    end
    return sales_array
  end

  def revenue
    #revenue: returns the the sum of all of the vendor's sales (in cents)
    all_sales = FarMar::Sales.all
    revenue_array = []
    all_sales.each do |sale|

    end

  end




end

vendor = FarMar::Vendors.all[1]
puts vendor.market
# 1,Feil-Farrell,8,1


# this works!! AND Holy crap it also helped me figure out how many vendors existed in the big ass file!!
# I wish I'd had a blueprint for this. .count, and length work the same!
# puts "you have: #{FarMar::Vendors.all.length} vendors"
#output: you have: 2690 vendors, prints twice. Should I be concerned?
#
# puts  FarMar::Vendors.find(144).name
# id: 1445, name: Stoltenberg Inc, num_of_employees: 6, market_id: 267

# id: 2690, name: Mann-Lueilwitz, num_of_employees: 4, market_id: 500
