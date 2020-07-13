#!/usr/bin/env ruby
require 'json'

file = File.read("products.json")
#data stores the products objects
data = JSON.load file

choice = gets.chomp

firstFilter = data.select{|product| product['product_type'] == choice}
firstFilter.each do |type|
    firstFilter = type['options'] && type['options']['gender']
end
puts firstFilter
