# markets_spec.rb
require_relative 'spec_helper'
require_relative '../far_mar'

describe FarMar::Markets do

# this was a test built to demonstrate Rake works.
  it "This is a test to even see if rake is working?" do
    market1 = FarMar::Markets.new("Seattle Market")
    expect(market1.name).must_equal("Seattle Market")
  end
end
