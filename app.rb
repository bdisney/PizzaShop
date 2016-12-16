#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end



get '/' do
	@products = Product.all

	erb :index
end

get '/about' do
	erb :about
end

get '/cart' do
	erb :cart
end

post '/cart' do
	orders_input = params[:orders]
	@orders = parse_orders_input orders_input
	@products = Product.all

	erb " HEllo #{@orders.inspect}"
end

orders_line = "product_1=1,product_2=1,product_3=2"

def parse_orders_input orders_input

	s1 = orders_input.split(/,/)

	arr = []
        
	s1.each do |x|
		s2 = x.split(/=/)

		s3 = s2[0].split(/_/)

		id = s3[1]
		cnt = s2[1]

		arr2 = [id, cnt]	
		arr.push arr2

	end
	
	return arr

end


post '/order' do
	return  erb :order

end


