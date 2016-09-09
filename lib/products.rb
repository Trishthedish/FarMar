# lib/products.rb
require_relative('../far_mar')
require_relative('./markets.rb')
require_relative('./sales.rb')
require_relative('./vendors.rb')

class FarMar::Products
  # Your code goes here

  attr_reader :id, :name, :vendor_id
  def initialize(id, name, vendor_id)
  # Each product belongs to a vendor. The vendor_id field refers to the FarMar::Vendor ID field. The FarMar::Product data, in order in the CSV, consists of:
    @id = id
    @name = name
    @vendor_id = vendor_id
  end
  def self.all
    products = CSV.read('./support/products.csv')
    products_array = []

    products.each do |product|
      id = product[0]
      name = product[1]
      vendor_id = product[2]
      product = FarMar::Products.new(id, name, vendor_id)
      products_array << product
    end
    return products_array
  end

  # input: id * not be confused with market id. Which will come later.
  # output: an instance of market object if there is a matching id in csv.
  def self.find(id)
    # nothing to do with the other product. I like keeping semantic & streamlined varibles. Yet, I could see how using products multiples times could be confusing.
    products = FarMar::Products.all
    products.each do |product|
      if product.id == id.to_s
        return product
      end
    end
    puts "invalid, entry"
  end

  def vendor
    #vendor: returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field
    vendor_id = self.vendor_id
    vendor = FarMar::Vendors.find(vendor_id)
    return vendor
  end

  def sales
    #sales: returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
    sales = FarMar::Sales.all
    sales_array = []
    sales.each do |sale|
      if sale.product_id == id
        sales_array << sale
      end
    end
    return sales_array
  end

  def number_of_sales
    #number_of_sales: returns the number of times this product has been sold.
    n_sales = FarMar::Sales.all
    n_sales_array = []
    n_sales.each do |item|
      if item.product_id == id
        n_sales_array << item
      end
    end
    return n_sales_array.count
  end

  def self.by_vendor(vendor_id)
    # self.by_vendor(vendor_id): returns all of the products with the given vendor_id
    products = FarMar::Product.all
    by_vendor_array = []
    products.each do |vendor|
      if vendor.vendor_id == vendor_id.to_s
        by_vendor_array << vendor
      end
    end
    return by_vendor_array
  end
end





# Testing new Vendor Method.
# x = FarMar::Products.all[5].vendor.name
# puts x
# output: Kris and Sons
# y = FarMar::Products.all[8].vendor.name
# puts y
# output: Reynolds, Schmitt and Klocko


#tests so that I can write my tests:

# puts FarMar::Products.all
# wooo it returns all them product objects!

# How many objects exist within this collection?
# puts "Product Count: #{FarMar::Products.all.length}"
# Product Count: 8,193
