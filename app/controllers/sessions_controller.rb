get '/sessions/new' do 
	erb :'sessions/new'
end 

post '/sessions' do
  @user = User.find_by(email: (params[:email]))
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect "/"
    else
      @errors = ["The username/password combo you entered was incorrect"]
      erb :'sessions/new'
    end
end