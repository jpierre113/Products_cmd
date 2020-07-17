#!/usr/bin/env ruby
require 'json'

file = File.read("products.json")
#data stores the products objects
data = JSON.load file

choice = gets.chomp.split(' ')

data.each do |product|
    # looping through the products converting it to a flattened 1 dimentional array of values, and compare those values with the input, printing the output if they match
    if (product.values.map{|value| value.class == Hash ? value.values : value}.flatten & choice).length == choice.length
        # iterate through array of hashes, placeholder for value here will find matching value to hash
        product.each do |key, value|
            if key != "id"
                if value.class == Hash
                    value.each do |options_key, options_value|
                        # exclude printing values that are inputted
                        puts "#{options_key} #{options_value}" if !choice.include?(options_value)
                    end
                else
                        puts "#{key} #{value}" if !choice.include?(value)
                end
            end
        end
    end
end
