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


# this is example of what data might look.
# [
#   [1,People's Co-op Farmers Market,30th and Burnside,Portland,Multnomah,Oregon,97202]
#   [2,Silverdale Farmers Market,98383,Silverdale,Kitsap,Washington,98383]
# ]
