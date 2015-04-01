get '/' do
  erb :index
end

get '/login' do
  erb :'auth/login'
end

post '/login' do
  @cur_user = User.find_by username: params[:name]
  if @cur_user && @cur_user.authenticate(params[:password])
    session[:user_id] = @cur_user.id
    redirect "/users"
  else
    [404, 'name or password incorrect']
  end
end

post '/create' do
  user = User.new(username: params[:username],
                  password: params[:password])

  if user.save
    session[:user_id] = user.id
    redirect "/users"
  else
    [403, 'client error']
    redirect '/signup'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end