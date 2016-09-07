# lib/markets.rb

# this title is wrong correct?
# lib/farmar_market.rb
# require_relative('../far_mar')

# follows typical path.
require_relative('../far_mar')
# does this go at the top of far_mar.rb??
# since i'm calling from main directory. From this current directory. So on dot.

class FarMar::Markets
  attr_reader # only id will be need to be passed & checked?
  def initialize(id, name, address, city, county, state, zip) #Each individual market has many vendors associated with it. The FarMar::Market data, in order in the CSV, consists of:
    @id = id
    @name = name
    @address = address
    @city = city
    @county = county
    @state = state
    @zip = zip
  end
  # grab market info from above & force it into self.all? or should I move it to below?
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
      market = FarMar:: Markets.new(id, name, address, city, county, state, zip)
      markets_array << market
    end
    return markets_array
  end

  # self.find(id)
  # also means to repeat this functionality per class?
  #self.find: returns an instance of the object where the value of the id field in the csv matches the passed parameter.
  # input: id
  # output: an instance of market object if there is a matching id in csv.
  def self.find(id)
    # not sure how to use already called variable outside self.all method. so until then, going to import it again.
    markets = CSV.read('./support/markets.csv')
    market_match = []
    markets.each do |market|
      id = market[0]
      if market[0] == id
        market = FarMar::Markets.new(id, name, address, city, county, state, zip)
        market_match << market
        return market
      else
        puts "Market not found!"
      end
    end

  end
# necessary to build:
  def vendors
    #vendors: returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
  end
# Read_ids
  def read_ids
    ids = []
    markets.each do |row|
      ids << row[0]
    end
  end
# read_names
  def read_names
    names = []
    markets.each do |row|
      names << row[1]
    end
  end
# read_ address
# Grabbing address, city, state, zip
  def read_address
    address = []
    markets.each do |row|
      address << row[2][3][4][5][6]
      puts address
    end
  end

end
puts "Cupcakes: #{FarMar::Markets.all}"
