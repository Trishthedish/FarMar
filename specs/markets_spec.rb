# markets_spec.rb
require_relative 'spec_helper'
require_relative '../far_mar'

# Able to get let to work. Though I'm not comfortable with using it as effortlessly. Thus, returning to old method. Get it to work. Then I'll refactor if time allows.
# describe FarMar::Markets do
# modeling after let lesson
# let(:market1) { FarMar::Market.new("Trish Stand", true) }
# let(:market2) { FarMar::Market.new("Jon Snows", false) }
# modeling after let lesson

# doesn't work but saving it.
# it "Can you call market.name correctly?" do
#   markets = FarMar::Market.all
#   markets.find(494)
#   expect(494).must_equal(market.id)
# # end
# id, name, address, city, county, state, zip)
describe FarMar::Markets do

# 1
# Testing that .all method returns all 500 objects.
  it "does .all method work??" do
      markets = FarMar::Markets.all.length
      expect(markets).must_equal(500)
  end
# 2
  it "does .find method work??" do
      market1 = FarMar::Markets.find(494).name
      expect(market1).must_equal("Northside Farmers' Market - Youngstown")
    # 494,Northside Farmers' Market - Youngstown,1105 Elm Street,Youngstown,Mahoning,Ohio,44505
    # # end
  end
# 3
#
  it "Does calling one instance in the market class return the market I'm looking for?" do
    market = FarMar::Markets.all.name
    expect(market.id).must_equal(5)
  end


end
