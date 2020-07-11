#!/usr/bin/env ruby
require 'optparse'

products = {}
OptionParser.new do |prod|
    prod.on("-p", "--product PRODUCT") do |type|
        products[:product] = type
    end
end.parse!
puts products[:product]
