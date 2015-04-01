get '/records/new' do
  erb :'/records/new'
end

post '/new' do
  new_record = Record.new(albumtitle:params[:albumtitle],
                          artist:params[:artist],
                          genre:params[:genre],
                          releaseyear:params[:releaseyear],
                          owneropinion:params[:owneropinion],
                          user_id:cur_user.id)

  if new_record.save!
    redirect "/users/#{cur_user.id}"
  else
    [403, 'error']
  end
end


get '/records/:id' do
  @record = Record.find_by(id:params[:id])

  @tracks = @record.tracks

  owner_id = @record.user_id
  @owner = User.find_by(id:owner_id).username

  @comments = @record.comments
  erb :'/records/single'
end

