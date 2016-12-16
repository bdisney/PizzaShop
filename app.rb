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
	@pre_order = params[:orders].split(',')
	@products = Product.all

	erb :cart
end

post '/order' do
	erb 'Type you name and addres'

end


