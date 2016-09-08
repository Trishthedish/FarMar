# markets_spec.rb
require_relative 'spec_helper'
require_relative '../far_mar'

# describe FarMar::Markets do
#   let(:market1) { FarMar::Market.new("Trish Stand", true) }
#   let(:market2) { FarMar::Market.new("Jon Snows", false) }
# modeling after let lesson

##### How should I break this down as far as test coverage. Do I need to seperate out per method?

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
  end

  # it "" do
  #
  # end




end
