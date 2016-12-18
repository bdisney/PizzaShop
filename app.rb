#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
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
	@orders_input = params[:orders_input]
	@items = parse_orders_input @orders_input
	@products = Product.all

	# выводим сообщение о том, что корзина пуста

	if @items.length == 0
		return erb :cart_is_empty
	end

	# выводим список продуктов в корзине

	@items.each do |item|
		# id, cnt
		item[0]	= @products.find(item[0])
	end

	erb :cart
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

get '/order' do
	erb :order
end

post '/order' do

	@new_order = Order.new params[:order]

	if @new_order.save
		erb 'Thank you! Your order has been placed.'

	else
		@error = @new_order.errors.full_messages.first
	end

	erb :order
end

get '/admin' do
	@orders = Order.all.order ('created_at')
	erb :admin
end




