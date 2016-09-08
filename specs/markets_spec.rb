# markets_spec.rb
require_relative 'spec_helper'
require_relative '../far_mar'

# Able to get let to work. Though I'm not comfortable with using it as effortlessly. Thus, returning to old method. Get it to work. Then I'll refactor if time allows.
# describe FarMar::Markets do
# modeling after let lesson
# let(:market1) { FarMar::Market.new("Trish Stand", true) }
# let(:market2) { FarMar::Market.new("Jon Snows", false) }
# modeling after let lesson


# id, name, address, city, county, state, zip)
describe FarMar::Markets do

# 1 - This was working!! Then it wasn't ...
# Testing that .all method returns all 500 objects.
  it "does .all method work??" do
    markets = FarMar::Markets.all.length
    expect(markets).must_equal(500)
  end
# 2 - This was working!! Then it wasn't ...
  it "does .find method work??" do
    market1 = FarMar::Markets.find(494).name
    expect(market1).must_equal("Northside Farmers' Market - Youngstown")
    # 494,Northside Farmers' Market - Youngstown,1105 Elm Street,Youngstown,Mahoning,Ohio,44505
    # # end
  end
# 3 - This wasn't working and still isnt!!
  it "Does calling one instance in the market class return the market I'm looking for?" do
    market = FarMar::Markets.all[0].id
    expect(market).must_equal(1)
  end


end

# How do I grab a market name?

# some_var = FarMar::Markets.all.name(????)
