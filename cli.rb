#!/usr/bin/env ruby
require 'json'

file = File.read("products.json")
#data stores the products objects
data = JSON.load file

opt1, opt2 = gets.chomp.split(' ')

#select the product based on the value if the class matches return array
firstFilter = data.select{|product| product.values.map{|value| value.class == hash ? value.values : value}.flatten && opt1 || opt2}

#accessing options hash
getGender = firstFilter.map{|gender| gender['options']['gender']}.compact.uniq
getColor = firstFilter.map{|color| color['options']['color']}.compact.uniq
getSize = firstFilter.map{|size| size['options']['size']}.compact.uniq
getType = firstFilter.map{|type| type['options']['type']}.compact.uniq
getStyle = firstFilter.map{|style| style['options']['style']}.compact.uniq

#based on filter display output
case
    when opt1 == "tshirt" && opt2 == nil
        print "gender: #{getGender} color: #{getColor}  size: #{getSize}"
    when opt1 == "tshirt" && (opt2 == "male" || opt2 == "female")
        print "color: #{getColor} size: #{getSize}"
    when opt1 == "mug" && opt2 == nil
        print "type: #{getType}"
    when opt1 == "sticker" && opt2 == nil
        print "size: #{getSize} style: #{getStyle}"
else
    print "Invalid product"
end
