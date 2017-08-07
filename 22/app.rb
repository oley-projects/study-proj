#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Welcome to Barber Shop!"			
end

get '/about' do
	erb :about
end

get '/contacts' do
	erb :contacts
end

post '/contacts' do
	@mailname = params[:mailname]
	@email = params[:email]
	@text = params[:text]

	@title = 'Thank you!'
	@message = "Dear #{@mailname}, your message sent successfully"

	f = File.open './public/contacts.txt', 'a'
	f.write "User: #{@mailname}, Phone: #{@phone}, Date: #{@datetime}\n"
	f.close

	erb :message
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]

	@title = 'Thank you!'
	@message = "Dear #{@username}, we'll be waiting for you at #{@datetime}"

	f = File.open './public/users.txt', 'a'
	f.write "User: #{@username}, Phone: #{@phone}, Barber: #{@barber}, Date: #{@datetime}\n"
	f.close

	erb :message
end
