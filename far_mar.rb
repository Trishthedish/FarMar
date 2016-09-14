# far_mar.rb = module ??

# gems your project needs
require 'csv'

# our namespace module
module FarMar; end

# all of our data classes that live in the module
# ...require all needed classes

# The classes: markets, products, sales, vendors.
require_relative 'lib/markets'
require_relative 'lib/products'
require_relative 'lib/sales'
require_relative 'lib/vendors'

# 1. Is this where are module will live?? Yes, see above.
# Will each file need to have some sort of holding place created here??

puts "hello"
# this is example of what data might look.
date = DateTime.parse('2013-11-08 21:00:32 -0800')
date2 = DateTime.parse('2013-11-08 21:06:32 -0800')
puts date
puts date2
sale_time_test = FarMar::Sales.between(date, date2)
puts "hello #{sale_time_test.length}"


# 9412,2320,2013-11-08 21:26:32 -0800,2115,6431
# #
# # 2013-11-11 06:44:12 -0800,5,8
# 2013-11-10 05:19:05 -0800,1,1
