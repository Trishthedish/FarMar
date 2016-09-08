# vendors_spec.rb
require_relative 'spec_helper'
require_relative '../far_mar'

#vendor objects have the following traits:
#id, name, num_of_employees, market_id
describe FarMar::Vendors do

## 1
  it "Does the .all method work to display all vendor objets in CSV? Should be a list of 2,690 vendor objects" do
    vendors = FarMar::Vendors.all.length
    expect(vendors).must_equal(2690)
  end

## 2
  it "Does .find method work to produce a corresponding & correct vendor?" do
    vendors = FarMar::Vendors.find(86).name
    expect(vendors).must_equal("Purdy-Kerluke")
# id: 86, name: Purdy-Kerluke, num_of_employees: 5, market_id: 18
  end

## 3
# Told that I should test the first item in collection
  it "Does calling one instance in the vendor class return the vendor I'm looking for (the fist instance of vendor object)?" do
      vendors = FarMar::Vendors.all[0].name
      expect(vendors).must_equal("Feil-Farrell")
      ## id: 1, name: Feil-Farrell, num_of_employees: 8, market_id: 1
  end

## 4 # testing last object instance...# Holy crap this works!!!
  it "Does the last item in the list equal the vendor that it's supposed to be?" do
      vendors = FarMar::Vendors.all.last.name
      expect(vendors).must_equal("Mann-Lueilwitz")
# id: 2690, name: Mann-Lueilwitz, num_of_employees: 4, market_id: 500
  end
# No idea how to write this test: Tesing if param passed in for .find will be properly converted and compared. As in: it treats an interger and string the same. I believe # 2 test an interger. Now for string.

## 5
  it "Will the .find method work if a string param is passed in?" do
    vendors = FarMar::Vendors.find("2360").name
    expect(vendors).must_equal("Boehm and Sons")
    #2360,Boehm and Sons,5,445
  end

## 6
  it "Does Vendor id 1445 return correct num of employees (5)?" do
    vendors = FarMar::Vendors.find(1445).num_of_employees
    expect(vendors).must_equal("6")
# id: 1445, name: Stoltenberg Inc, num_of_employees: 6, market_id: 267

  end
## 7
  it "If .find method is passed a parameter(id) that isn't present will it throw the correct error??" do
    vendor = FarMar::Vendors.find(2691)
    expect(vendor).must_equal(nil)
  end
## 8
# does .all method return each objects instances of the vendor class?
# loop through then use instance of..FarMar::Vendor class eventually placed at top.
## 9
  # it "Testing that .all method will return each of the vendor object instances." do
  #   vendors = FarMar::Vendors.all
  #
  #     vendors.each do |vendor|
  #
  #
  #     assert obj.instance_of?(FarMar::Vendors class)
  #     # or is it, assert.instance_of...
  #     # assert obj.instance_of?(cls), msg
  #     end

end
