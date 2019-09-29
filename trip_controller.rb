require('sinatra')
require('sinatra/reloader')
require_relative('models/bucketlist')
require_relative('models/cities')
require_relative('models/countries')
require_relative('models/sights')
also_reload('./models/*')
require('pry')



# index
get '/' do
  @bucketlist = BucketList.all
  erb( :index )
end

# new
get '/sights' do
  @sight = Sight.all
  erb( :new )
end

# new
get '/sights/new' do
  @sight = Sight.all
  erb( :new )
end

# show
get '/bucketlist/:id' do
  @bucketlist = BucketList.find(params['id'])
  erb( :show )
end

get '/students/:id' do
  @student = Student.find(params['id'])
  @house = House.find(@student.house_id)
  erb( :show )
end

# create
post '/sight' do
  Sight.new(params).save
  redirect '/bucketlist'
end

# edit
get '/bucketlist/:id/edit' do
  @bucketlist = Bucketlist.find(params['id'])
  @sight = Sight.all
  erb( :edit )
end

# update
put '/bucketlist/:id' do
  Bucketlist.new(params).update
  redirect '/bucketlist'
end

# destroy
delete '/bucketlist/:id' do
  bucketlist = Bucketlist.find(params['id'])
  bucketlist.delete
  redirect '/bucketlist'
end
