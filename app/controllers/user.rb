get '/users/:id' do
  @cur_user = User.find_by(id:session[:user_id])
  @user_list = User.all
  erb :'users/index'
end

# get '/records/:id' do
#   @cur_user = User.find_by(id:session[:user_id])
#   @user_list = User.all
#   erb :'records/single'
# end