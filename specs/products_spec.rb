# product_spec.rb
require_relative 'spec_helper'
require_relative '../far_mar'

# product examples to use:
# 29,Crazy Fish,11
# 30,Depressed Beets,11
# 31,Sore Chicken,11
# id, name, vendor_id

describe FarMar::Products do
#1
  it "Does .all method return a collection of instances of all the product instances?" do
    products = FarMar::Products.all.count
    expect(products).must_equal(8193)
  end
#2
# Trish you should rewrite earlier test to reflect the verbiage. Previously just used, does .find method work??
  it "Does .find method return an instance of the object where the value of the id field in the CSV match passed parameter" do
    # using .find() don't need to specify id. As its implicitly passed in.
    products = FarMar::Products.find(31).name
    expect(products).must_equal("Sore Chicken")
  end

#3
# Told that I should test the first & last items.
  it "Does calling one instance in the product class return the products I'm looking for (first in line)" do
      products = FarMar::Products.all[0].name
      expect(products).must_equal("Dry Beets")
  end

#4 TEST THE last THING -- is what you expected??
   it "Does calling one instance in the product class return the product I'm looking for (at the end of collection). " do
      products = FarMar::Products.all.last.name
      expect(products).must_equal("Cruel Beef")
      #The last product info: 8193,Cruel Beef,2690
   end
#5
    it "Does the product at indice 32 match the correct product vendor id. Should be 11 " do
        # seem like there will be another way to write this.
        products = FarMar::Products.all[31].vendor_id
        expect(products).must_equal("11")
        # 31,Sore Chicken,11
    end
# No idea how to write this test: Tesing if param passed in for .find will be properly converted and compared. As in: it treats an interger and string the same. I believe # 2 tests an interger. Now for string!
# 6
  it "Will the .find method work if a string param is passed in? Id:29, will return 'Crazy Fish' " do
    products = FarMar::Products.find("29").name
    expect(products).must_equal("Crazy Fish")
    # 29,Crazy Fish,11
  end

# 7
  it "If .find method is passed a parameter that isn't present will it throw the correct error?" do
    products = FarMar::Products.find(8194)
    expect(products).must_equal(nil)
  end
end
