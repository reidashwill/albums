require('sinatra')
require('sinatra/reloader')
require('./lib/albums')
require('pry')
also_reload('lib/**/*.rb')

get('/test') do
  @something = "this is a variable"
  erb(:whatever)
end

get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums') do
  @albums = Album.all
  erb(:albums)
end

get('/albums/new') do
  Album.allow_edits
  erb(:new_album)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

post('/albums') do
  if Album.edits_are_allowed
    name = params[:album_name]
    album = Album.new(name, nil)
    album.save()
    @albums = Album.all()
    erb(:albums)
  else
    erb(:not_allowed)
  end
end

# get('/albums/:id/edit') do
#   "This will take us to a page with a form for updating an album with an ID of #{params[:id]}."
# end

patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update(params[:name])
  @albums = Album.all
  erb(:albums)
end

# delete('/albums/:id') do
#   "This route will delete an album. We can't reach it with a URL. In a future lesson, we will use a delete button that specifies a DELETE action to reach this route."
# end

# get('/custom_route') do
#   "We can even create custom routes, but we should only do this when needed."
# end