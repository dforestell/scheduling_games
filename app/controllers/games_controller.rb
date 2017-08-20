get '/games' do
	@games = Game.all
	erb :'games/index'
end

get '/games/new' do
	if logged_in?
		if request.xhr?
			erb :'games/_new', layout: false
		else	
		erb :'games/new'
		end	
	else
		if request.xhr?
			status 418
			"You must be logged in to post a game!"
		else
		redirect '/'
		end
	end
end

get '/games/available' do
	if logged_in?
		@games = Game.where(traveler_id: nil)
		erb :'games/available'
	else
		redirect '/'
	end

end

get '/games/:id' do
	@game = Game.find(params[:id])
	erb :'games/show'
end

post '/games/:id' do
	@game = Game.find(params[:id])
	p @game
	if logged_in?

		@game.update(traveler_id: current_user.id)
			redirect "/games/#{@game.id}"
	else
		redirect '/'
	end
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
