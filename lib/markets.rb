# lib/markets.rb

# this title is wrong correct?
# lib/farmar_market.rb
# require_relative('../far_mar')

# follows typical path.
require_relative('../far_mar')
# does this go at the top of far_mar.rb??
# since i'm calling from main directory. From this current directory. So on dot.

class FarMar::Markets
  markets = CSV.read('./support/markets.csv')

  def initialize

  end

  def self.all
    Objectspace.each_object(self).to_a
  end
  def self.all
    all.count
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
