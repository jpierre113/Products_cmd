#!/usr/bin/env ruby
require 'json'

file = File.read("products.json")
#data stores the products objects
data = JSON.load file

choice = gets.chomp

firstFilter = data.select{|product| product['product_type'] == choice}
#accessing options hash
getGender = firstFilter.map{|gender| gender['options']['gender']}.compact.uniq
getColor = firstFilter.map{|color| color['options']['color']}.compact.uniq
getSize = firstFilter.map{|size| size['options']['size']}.compact.uniq

# firstFilter.each do |type|
#     firstFilter = type['options']
# end

print getGender + getColor + getSize
