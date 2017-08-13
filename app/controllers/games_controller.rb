get '/games' do 
	@games = Game.all
	erb :'games/index'
end 

get '/games/new' do 
	if logged_in?
		erb :'games/new'
	else
		redirect '/'
	end
end

get '/games/:id' do 
	@game = Game.find(params[:id])
	erb :'games/show'
end

post '/games' do 
	@game = Game.new(params[:game])
	@game.host_id = current_user.id

	if @game.save
		redirect "/games/#{@game.id}"
	else
		redirect '/'
	end
end