#----------NEW COMMENT
get '/records/:id/comments/new' do
  @cur_record = Record.find_by(id:params[:id])
  erb :'/comments/new'
end

post '/records/:id/comments/new' do
  new_comment= Comment.new(body:params[:body],
                           record_id:params[:id],
                           user_id:cur_user.id)

  if new_comment.save!
    redirect "/records/#{params[:id]}"
  else
    [403, 'error']
  end
end

#---------EDIT COMMENT
get '/comments/:id/edit' do
  @cur_comment = Comment.find_by(id:params[:id])
  erb :'/comments/edit'
end

put '/comments/:id/edit' do
  edit_comment = Comment.find_by(id:params[:id])

  edit_comment.body = params[:body]

  if edit_comment.save!
    redirect "/records/#{edit_comment.record_id}"
  else
    [403, 'error']
  end
end

#-------- DELETE COMMENT

get '/comments/:id/delete' do
  @cur_comment = Comment.find_by(id:params[:id])
  erb :'/comments/delete'
end

delete '/comments/:id/delete' do
  delete_comment = Comment.find_by(id:params[:id])
  record_id = delete_comment.record_id

  if delete_comment.destroy!
    redirect "/records/#{record_id}"
  else
    [403, 'error']
  end
end