# lib/products.rb
require_relative('../far_mar')

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
end


#tests so that I can write my tests:

# puts FarMar::Products.all
# wooo it returns all them product objects!

# How many objects exist within this collection?
# puts "Product Count: #{FarMar::Products.all.length}"
# Product Count: 8,193
