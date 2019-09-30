require('sinatra')
require('sinatra/reloader')
require_relative('models/trip')
require_relative('models/city')
require_relative('models/country')
require_relative('models/sight')
also_reload('./models/*')
require('pry')



# index
get '/' do
  @trips = Trip.all
  erb( :index )
end

get '/sights/new' do
  @sights = Sight.all
  @cities = City.all
  erb( :new )
end

# save new sight
post '/sights/new' do
  sight = Sight.new(params)
  sight.save
  redirect '/trips'
end

#show
get '/sights/:id' do
  @sight = Sight.find(params['id'])
  erb( :show )
end


get '/sights' do
  @sights = Sight.all
  erb( :'sights/index' )
end

get '/cities' do
  @cities = City.all
  erb( :'cities/index' )
end

get '/countries' do
  @countries = Country.all
  erb( :'countries/index' )
end

get '/cities/new' do
  @countries = Country.all()
  erb( :'cities/new')
end

post '/trips/new' do
  trip = Trip.new({'sight_id' => params['sight_id'], 'visited' => false})
  trip.save
  redirect '/trips'
end

post '/cities' do
  city = City.new(params)
    city.save
  redirect '/sights/new'
  end

  get '/trips' do
    @trips = Trip.all()
    erb( :'trips/index')

  end
