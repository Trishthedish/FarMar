# markets_spec.rb
require_relative 'spec_helper'
require_relative '../far_mar'

describe FarMar::Markets do
  let(:market1) { FarMar::Market.new("Trish Stand", true) }
  let(:market2) { FarMar::Market.new("Jon Snows", false) }
# modeling after let lesson
  it "Dose market have a name?" do
    market1.name.must_equal("Trish Stand")
    market2.name.must_equal("Jon Snows")
  end

  it "Does .all return all market objects" do

  end

  it "" do

  end




end
