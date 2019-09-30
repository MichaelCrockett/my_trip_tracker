require('sinatra')
require('sinatra/reloader')
require_relative('models/trip')
require_relative('models/cities')
require_relative('models/countries')
require_relative('models/sights')
also_reload('./models/*')
require('pry')



# index
get '/' do
  @trip = Trip.all
  erb( :index )
end

get '/sights' do
  @trip = Trip.all
  erb( :index )
end

get '/sights/new' do
  @sights = Sight.all
  erb( :new )
end

# add new sight
post '/sight' do
  Sight.new(params).save
  redirect '/sights'
end

# update
put '/sights/:id' do
  Sight.new(params).update
  redirect '/sights'
end
