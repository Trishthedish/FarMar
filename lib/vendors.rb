# lib/vendors.rb
require_relative('../far_mar')

#
# ruby lib/vendors.rb

class FarMar::Vendors
  # Your code goes here
  attr_reader :id, :name, :market_id

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

end
# this works!! AND Holy crap it also helped me figure out how many vendors existed in the big ass file!!
# I wish I'd had a blueprint for this. .count, and length work the same!
# puts "you have: #{FarMar::Vendors.all.length} vendors"
#output: you have: 2690 vendors, prints twice. Should I be concerned?
# 
# puts  FarMar::Vendors.find(144).name
# id: 1445, name: Stoltenberg Inc, num_of_employees: 6, market_id: 267

# id: 2690, name: Mann-Lueilwitz, num_of_employees: 4, market_id: 500
