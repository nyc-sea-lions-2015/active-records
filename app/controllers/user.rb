get '/users' do
  @user_list = User.all
  erb :'users/index'
end

get '/users/:id' do

  erb :'users/dashboard'
end

# get '/records/:id' do
#   @cur_user = User.find_by(id:session[:user_id])
#   @record = Record.find_by(id:params[:id])

#   owner_id = @record.user_id
#   @owner = User.find_by(id:owner_id).username

#   @comments = @record.comments
#   erb :'records/single'
# end
