require 'pry'
require 'dotenv'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

# This function return the name of city
require 'pry'
require 'dotenv'
require 'rubygems'
require 'nokogiri'
require 'open-uri'

puts "Un peu de patience, ca arrive INSHAALAH..."


page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

crypto_name_array = page.xpath('///td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]')


crypto_name_array.map do |crypto_name|
     crypto_name.text
end


crypto_value = page.xpath('///td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]')
end

def crypto_array(crypto_name_array,crypto_value)
    cryptocurrencies_array = Array.new
    (0...crypto_name_array.size).each do |num|
        name = crypto_name_array[num]
        value = crypto_value[num]
        result = Hash.new
        result[name] = value
        cryptocurrencies_array << result
      end
      return cryptocurrencies_array
    end