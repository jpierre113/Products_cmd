#!/usr/bin/env ruby
require 'json'

file = File.read("products.json")
#data stores the products objects
data = JSON.load file

shirt_only = data.select{|product| product['product_type'] == "tshirt"}
puts shirt_only
