#!/usr/bin/env ruby
require 'json'

file = File.read("products.json")
#data stores the products objects
data = JSON.load file

choice = gets.chomp.split(' ')

data.each do |product|
    #looping through product, searching through the values if class is the same as the hash assign value. Make it 1 demensional array
    if (product.values.map{|value| value.class == Hash ? value.values : value}.flatten & choice).length > 0
        #iterate through array of hashes, placeholder for value here will find matching value to hash
        product.each do |key, value|
            if key != "id"
                puts ""
                    if value.class == Hash
                        value.each do |key2, value2|
                            #exclude printing values that are inputted
                            puts "#{key2} #{value2}" if !choice.include?(value2)
                        end
                    else
                        puts "#{key} #{value}" if !choice.include?(value)
                    end
            end
        end
    end
end
