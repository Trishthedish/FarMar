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
  def initialize(id, name, address, city, county, state, zip)
  #Each individual market has many vendors associated with it. The FarMar::Market data, in order in the CSV, consists of:
    @id = id
    @name = name
    @address = address
    @city = city
    @county = county
    @state = state
    @zip = zip
  end
  # loaded all of the information from CSV file with:
  # how can I associate all wiht this: an array of arrays.
  markets = CSV.read('./support/markets.csv')


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
