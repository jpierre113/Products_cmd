#!/usr/bin/env ruby
require 'optparse'
require 'json'

file = File.read("products.json")
#data stores the products objects
data = JSON.load file


products = {}
OptionParser.new do |prod|
    prod.on("-p", "--product PRODUCT") do |type|
        products[:product] = type
    end
end.parse!
puts products[:product]
