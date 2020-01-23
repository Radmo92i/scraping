require 'pry'
require 'dotenv'
require 'rubygems'
require 'nokogiri'
require 'open-uri'



def crypto_name(page)
return name = page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]')
end

def crypto_price(page)
return price = page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]')
end


def create_database(name,price)
    sym_price=[]
    for i in 0...name.size
        sym_price << {name[i].to_s => price[i].to_s.delete("$").to_f}
    end
    return sym_price
end

def perform
	page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	return create_database(crypto_name(page),crypto_price(page)).to_a
end

puts perform