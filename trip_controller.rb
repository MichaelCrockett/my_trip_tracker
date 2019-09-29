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


get '/sights' do
  "Page of sights"
end


get '/sights/new' do
  "Page to add new sights"
end


get '/bucketlist/:id' do
  "page to show user's bucketlist"
end

post 'sight' do
 "page to create new sight"
  end

get '/bucketlist/:id/edit' do
 "Page to edit existing bucketlist"
end

put '/bucketlist/:id' do
  "route to update"
end

delete '/bucketlist/:id' do
bucketlist = Bucketlist.find(params['id'])
bucketlist.delete
redirect '/bucketlist'
end
