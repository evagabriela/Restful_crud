get '/notes' do
  # Look in app/views/index.erb
  # @notes = Note.all
  erb :index
end

post '/notes' do #create
  # raise params[:note].inspect
  note = Note.create(params[:note])  #Here I am saving the user inputs to the table's columns 
  
  redirect "/notes/#{note.id}"
end

get '/notes/:id' do #show/read
  @note = Note.find(params[:id])
  erb :show_note 
end

get '/note/:id/edit' do
  @note = Note.find(params[:id])
  erb :edit_note
end

post '/notes/:id/edit' do  #updating
  Note.update(params[:id],:title => params[:title], :content => params[:content])
  redirect "/note/#{params[:id]}"
end

post '/note/:id/delete' do  #delete
  Note.destroy(params[:id])
redirect "/"
end

