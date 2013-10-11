get '/' do 
  puts "[LOG] Getting /"
  puts "[Log] Params: #{params.inspect}"
  erb :index 
end 
 
get '/entered_name' do 
	puts "[LOG] Getting /entered_name" 
	puts "[LOG] Params: #{params.inspect}"  
	erb :entered_name 
end 
 
post '/posting' do 
	@user = User.create(name: params[:name]) 
	redirect '/entered_name' 
end
 
post '/edit/:id' do 
	@user = User.find(params[:id])
	erb :edit 
end

post '/edit/:id' do
	@user = User.find(params[:id])
	@user.name = params[:name]
	@user.save

	erb :edit 
end 

post '/delete/:id' do
	user = User.find(params[:id])
	user.destroy

	redirect '/'
end