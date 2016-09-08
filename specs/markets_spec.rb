# markets_spec.rb
require_relative 'spec_helper'
require_relative '../far_mar'
# Able to get let to work. Though I'm not quite comfortable with using it as effortlessly. Thus, returning to old method. Get it to work. Then I'll refactor if time allows.
# describe FarMar::Markets do
# modeling after let lesson
# let(:market1) { FarMar::Market.new("Trish Stand", true) }
# let(:market2) { FarMar::Market.new("Jon Snows", false)
# modeling after let lesson
# id, name, address, city, county, state, zip)

describe FarMar::Markets do
#1
  it "Dose .all method work??" do
    markets = FarMar::Markets.all.length
    expect(markets).must_equal(500)
  end
#2
  it "Does .find method work??" do
    market1 = FarMar::Markets.find(494).name
    expect(market1).must_equal("Northside Farmers' Market - Youngstown")
# 494,Northside Farmers' Market - Youngstown,1105 Elm Street,Youngstown,Mahoning,Ohio,44505
  end
#3
# Told that I should test the first & last items.
  it "Does calling one instance in the market class return the market I'm looking for @[0][0]?" do
      market = FarMar::Markets.all[0].id
      expect(market).must_equal("1")
  end
#4 # testing last object instance...# Holy crap this works!!!
  it "Does the last item in the list eqaul the market that it's supposed to be?" do
      market = FarMar::Markets.all.last.name
      expect(market).must_equal("Montefiore Medical Center Farmers Market_Thursday")
  end
# No idea how to write this test: Tesing if param passed in for .find will be properly converted and compared. As in: it treats an interger and string the same. I believe # 2 test an interger. Now for string.
# 5
  it "Will the .find method work if a string param is passed in?" do
    far_mart = FarMar::Markets.find("494").address
    expect(far_mart).must_equal("1105 Elm Street")
  end



end
# trying to get to end of document...
# all[all.length]


# Not as clear to me what test should be written as it was to test things in scrabble.

# How do I grab a market name?

# some_var = FarMar::Markets.all.name(????)
