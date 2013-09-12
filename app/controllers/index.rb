get '/' do
  # Look in app/views/index.erb
  # @notes = Note.all
  erb :index
end

post '/new_note' do #create  ==> to be restful I can call it 'notes' cause is listing all note

  note = Note.new  #Here I am saving the user inputs to the table's columns 
  note.title = params[:title] # ===>  I can just use shortcut
  note.content = params[:content]
  note.save

  redirect "/note/#{note.id}"   #===>  name /notes/#{note.id}"
end

get '/note/:id' do #show/read   #==> name/notes/:id
  @note = Note.find(params[:id])
  erb :show_note 
end

get '/note/:id/edit' do    
  @note = Note.find(params[:id])
  erb :edit_note
end

post '/note/:id/edit' do  #updating  # ===> here is the put (restful)
  Note.update(params[:id],:title => params[:title], :content => params[:content])
  redirect "/note/#{params[:id]}"
end

post '/note/:id/delete' do  #delete  #===> here is the destroy (restful)
  Note.destroy(params[:id])
redirect "/"
end

