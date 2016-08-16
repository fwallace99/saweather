require 'rubygems'
require 'bundler'
Bundler.setup
require 'sinatra'
require 'json'
require 'rest-client'
require 'date'

get '/' do

  api_result = RestClient.get 'http://api.openweathermap.org/data/2.5/forecast/city?id=5404119&units=imperial&APPID=212971bce0ac5ea49c53383f9023a61a'
  jhash = JSON.parse(api_result)
  name = jhash['city']['name']
  temp = jhash['list']


  erb :index, :locals => {name: name, parse_data: temp}


end
