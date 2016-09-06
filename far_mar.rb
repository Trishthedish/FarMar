# far_mar.rb = module ??

# gems your project needs
require 'csv'

# our namespace module
module FarMar; end


# all of our data classes that live in the module
require_relative 'lib/markets'
require_relative 'lib/products'
require_relative 'lib/sales'
require_relative 'lib/vendors'

# ...require all needed classes

# 1. or will the end of above will be far_mar'?


# 2. Is this where are module will live?? Yes, see above.

# For each of the classes?

# The classes will include: markets, products, sales, vendors.
