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
getType = firstFilter.map{|type| type['options']['type']}.compact.uniq
getStyle = firstFilter.map{|style| style['options']['style']}.compact.uniq

#based on filter display output
if getGender == true || getColor == true || getSize == true
    print "gender: #{getGender} color: #{getColor}  size: #{getSize}"
elsif getType == true
  print "type: #{getType}"
else
  print "size: #{getSize} style: #{getStyle}"
end
