#!/usr/bin/env ruby
require 'json'

file = File.read("products.json")
#data stores the products objects
data = JSON.load file

choice = gets.chomp.split(' ')

response = []
# matching responses are listed in array
def filter_response(key, value, choice, response)
    response << {key => value} if !choice.include?(value)
end

data.each do |product|
    # looping through the products converting it to a flattened 1 dimentional array of values, and compare those values with the input, printing the output if they match
    if (product.values.map{|value| value.class == Hash ? value.values : value}.flatten & choice).length == choice.length
        # iterate through array of hashes, placeholder for value here will find matching value to hash
        product.each do |key, value|
            if key != "id"
                if value.class == Hash
                    value.each do |options_key, options_value|
                        # exclude printing values that are inputted
                        filter_response(options_key, options_value, choice, response)
                    end
                else
                    filter_response(key, value, choice, response)
                end
            end
        end
    end
end
# unique response will be outputted
response.uniq.flat_map(&:entries)
  .group_by(&:first)
  .map{|key, value| puts "#{key}: #{value.map(&:last).join(' ')}" }
