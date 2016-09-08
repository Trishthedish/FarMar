## Notes
TRISH you will need to clean this up later!!

# TRISH: Rake wants to see ONE dot. If you're testing things prior to going to rake. ie the terminal. Use 2 dots OR use the following set up:
old way to run: ruby vendors.rb
The better way: ruby lib/vendors.rb 

PS1="$status_style"'$fill \t\n'"$prompt_style"'${debian_chroot:+($debian_chroot)}:tulip:  \e[36m$(pc)\e[m \w\$'"$command_style “ (Change the tulip to your own name or your favorite emoji!)
#wrote these but I don't think I need them.
# # Read_ids
#   def read_ids
#     ids = []
#     markets.each do |row|
#       ids << row[0]
#     end
#   end
# # read_names
#   def read_names
#     names = []
#     markets.each do |row|
#       names << row[1]
#     end
#   end
# # read_ address
# # Grabbing address, city, state, zip
#   def read_address
#     address = []
#     markets.each do |row|
#       address << row[2][3][4][5][6]
#       puts address
#     end
#   end



# CSV.foreach('./support/markets.csv') do |row|
#   puts row.inspect
# end
# markets[0][0] # this 1


THIS IS IS ONE INSTANCE>
id = markets[0][0]
name = markets[0][1]
address = markets[0][2]
city = markets[0][3]
county = markets[0][4]
state = markets[0][5]
zip = markets[0][6]

markets = CSV.read('./support/markets.csv')
# markets variable now one big array representing table. # each table row an array, our market





#------------#
1. Get your data into a comma seperatted format.
markets = CSV.read('./support/markets.csv')
# markets variable now one big array representing table. # each table row an array, our markets

  CSV.foreach('./support/markets.csv') do |row|
    puts row.inspect
  end


#------------#
## Module: The module provides a namespace for the application. A namespace ensures the classes we create will not 'collide' or 'overlap' with a class that could exist elsewhere in a codebase (like in a gem).

Baseline Requirements

Create a class for each of the data types listed above. Each class should be a part of the FarMar module.
You should be able to create instances of these classes that know about their associated data file.
Create your far_mar.rb file which will bring together all classes created in the previous step.

# does that mean will have the same amount of classes per data type listed?
Or, will it be only for things we don' t repeat?

#FarMar::Market
7 Classes?
ID - (Fixnum) a unique identifier for that market
Name - (String) the name of the market (not guaranteed unique)
Address - (String) street address of the market
City - (String) city in which the market is located
County - (String) county in which the market is located
State - (String) state in which the market is located
Zip - (String) zipcode in which the market is located

#FarMar::Vendor
5 classes?
ID - (Fixnum) uniquely identifies the vendor
Name - (String) the name of the vendor (not guaranteed unique)
No. of Employees - (Fixnum) How many employees the vendor has at the market
Market_id - (Fixnum) a reference to which market the vendor attends

# FarMar::Product
3 classes?
ID - (Fixnum) uniquely identifies the product
Name - (String) the name of the product (not guaranteed unique)
Vendor_id - (Fixnum) a reference to which vendor sells this product

#FarMar::Sale
5 classes?
ID - (Fixnum) uniquely identifies the sale
Amount - (Fixnum) the amount of the transaction, in cents (i.e., 150 would be $1.50)
Purchase_time - (Datetime) when the sale was completed
Vendor_id - (Fixnum) a reference to which vendor completed the sale
Product_id - (Fixnum) a reference to which product was sold

This website was super helpful:

https://www.sitepoint.com/guide-ruby-csv-library-part/
