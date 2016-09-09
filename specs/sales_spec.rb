# sales_spec.rb
require_relative 'spec_helper'
require_relative '../far_mar'

# id, amount, purchase_time, vendor_id, product_id

#FIRST: id: 1, amount: 9290, purchase_time: 2013-11-07 04:34:56 -0800, vendor_id: 1, product_id: 1
#LAST: id: 12001,amount: 8923.0, purchase_time: 2013-11-12 02:03:31 -0800,vendor_id: 2690, product_id: 8192

#random examples:
# id: 15, amount: 8924, purchase_time: 2013-11-10 11:31:16 -0800, vendor_id: 3, product_id: 4
# id: 16,amont: 2277, purchase_time: 2013-11-09 01:16:47 -0800,vendor_id:3, product_id: 4


describe FarMar::Sales do
#1
  it "Does .all method return a collection of instances of all the sale instances?" do
    sales = FarMar::Sales.all.count
    expect(sales).must_equal(12798)
    # Sales total count: 12798
  end
#2 . find method not built yet.
  it "Does .find method return an instance of the object where the value of the id field in the CSV match passed parameter?" do
    # using .find() don't need to specify id. As its implicitly passed in.
    sales = FarMar::Sales.find(15).amount
    expect(sales).must_equal("8924")
    # amount: 8924
  end

#3
#FIRST: id: 1, amount: 9290, purchase_time: 2013-11-07 04:34:56 -0800, vendor_id: 1, product_id: 1
# Told that I should test the first & last items.
  it "Does calling one instance in the sales class return the sale object on (first in line)?" do
      sales = FarMar::Sales.all[0].purchase_time
      # using it as string, for now. more tests will need to be written once you begin to convert data. After you've got this written.
      expect(sales).must_equal("2013-11-07 04:34:56 -0800")
  end

#4 TEST THE last THING -- is what you expected??
   it "Does calling one instance in the sales class return the sales I'm looking for (at the end of collection)? " do
      sales = FarMar::Sales.all.last.product_id
      expect(sales).must_equal("8192")
    # must use string, because you use the to_s method.
    #LAST: id: 12001,amount: 8923.0, purchase_time: 2013-11-12 02:03:31 -0800,vendor_id: 2690, product_id: 8192
   end
#5
    it "Does the sales indice at 32 match the correct product vendor id. Should be  " do
        #vendor_id: 7
        sales = FarMar::Sales.all[32].vendor_id
        #product_id: 14
        sales2 = FarMar::Sales.all[32].product_id
        expect(sales).must_equal("7")
        expect(sales2).must_equal("14")
      # id, amount, purchase_time, vendor_id, product_id
      # 32,1980,2013-11-12 03:41:53 -0800,7,14
    end

# No idea how to write this test: Tesing if param passed in for .find will be properly converted and compared. As in: it treats an interger and string the same. I believe # 2 tests an interger. Now for string!
# 6
  it "Will the .find method work if a string param is passed in? Id:29, will return 'Crazy Fish' " do
    sales = FarMar::Sales.find("16").amount
    expect(sales).must_equal("2277")
    #id: 16,amont: 2277, purchase_time: 2013-11-09 01:16:47 -0800,vendor_id:3, product_id: 4
  end

# 7
  it "If .find method is passed a parameter that isn't present will it throw the correct error?" do
    sales = FarMar::Sales.find(12798)
    expect(sales).must_equal(nil)
  end
end
