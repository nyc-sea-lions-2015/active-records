get '/users' do
  @user_list = User.all
  erb :'users/index'
end

get '/users/:id' do

  erb :'users/dashboard'
end

