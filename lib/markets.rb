# lib/markets.rb

# this title is wrong correct?
# lib/farmar_market.rb
# require_relative('../far_mar')

# follows typical path.
require_relative('../far_mar')
# require_relative('./vendors.rb')
# does this go at the top of far_mar.rb??
# since i'm calling from main directory. From this current directory. So on dot.

class FarMar::Markets

  attr_reader :id, :name, :address

  def initialize(id, name, address, city, county, state, zip) #Each individual market has many vendors associated with it. The FarMar::Market data, in order in the CSV, consists of:
    @id = id
    @name = name
    @address = address
    @city = city
    @county = county
    @state = state
    @zip = zip
  end
  # output: return a collection of instances, representing ALL of the objects described in the CSV
  def self.all
    markets = CSV.read('./support/markets.csv')
    markets_array = []
    # research .map and see if after mvp you can use map.
    markets.each do |market|
      id = market[0]
      name = market[1]
      address = market[2]
      city = market[3]
      county = market[4]
      state = market[5]
      zip = market[6]
      market = FarMar::Markets.new(id, name, address, city, county, state, zip)
      markets_array << market
    end
    return markets_array
  end
  # input: id
  # output: an instance of market object if there is a matching id in csv.
  def self.find(id)
    markets = FarMar::Markets.all
    markets.each do |market|
      if market.id == id.to_s
        return market
      end
    end
    puts "invalid, entry"
  end

  def vendors
    #vendors: returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
    vendors_array = []
    vendors = FarMar::Vendors.all
    vendors.each do |vendor|
      if vendor.market_id == @id.to_s
        vendors_array << vendor
      end
    end
    return vendors_array
  end
# compare market id with  and if they match push.
# necessary to build:
  # WRITING AN INSPECT METHOD???
  # def inspect(name)
  #
  # end


end

# Test for new vendors method. It returns all the instances that are associated by the matching market_id field.
# I tested this in my vendors test. Do I really need to build another??
# vendor_test = FarMar::Markets.find(1)
# print vendor_test.vendors



# puts  FarMar::Markets.find(494)
# puts  FarMar::Markets.find(494)
# puts FarMar::Markets.all.length
# puts FarMar::Markets.all
