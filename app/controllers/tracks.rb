get '/records/:id/tracks/new' do
  @cur_record = Record.find_by(id:params[:id])
  erb :'/tracks/new', layout: false
end

post '/records/:id/tracks/new' do
  new_track= Track.new(title:params[:title],
                        record_id:params[:id])

  unless new_track.save!
    [403, 'error']
  end

  new_track.save!
  
  if request.xhr?
    return new_track.to_json
  else
    redirect "/records/#{params[:id]}"
  end

end