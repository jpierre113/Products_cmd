#!/usr/bin/env ruby
require 'json'

file = File.read("products.json")
#data stores the products objects
data = JSON.load file

choice = gets.chomp

firstFilter = data.select{|product| product['product_type'] == choice}
#accessing options hash
firstFilter.each do |type|
    firstFilter = type['options']
end
puts firstFilter
