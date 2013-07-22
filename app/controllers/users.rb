
register Sinatra::Flash

get '/user/register' do
  erb :'/user/new'
end

post '/user/register' do
  @current_user = User.new(email: params[:user][:email], first_name: params[:user][:first_name],
                           last_name: params[:user][:last_name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
  @current_user.save
  if @current_user.id
    session[:id] = @current_user.id
    redirect '/user/portal'
  else
    "#{@current_user.errors.each {|error| flash[:error] = error }}"
    redirect '/user/register' 
  end
end

get '/user/profile' do
  erb :'/user/profile'
end

post '/user/login' do
  @current_user = User.authenticate(params[:email], params[:password])
  if @current_user
    session[:id]= @current_user.id

    redirect '/user/portal'
  else
    flash[:error] = "Login failed! Please try again!"

    redirect '/'
  end
end

get '/user/logout' do
  session[:id] = nil

  redirect '/'
end

get '/user/portal' do
  @decks = Deck.all
  
  current_user

  find_stats(@current_user) if @current_user.rounds.count > 0
    
  

  if @current_user
    erb :'/user/portal'
  else 
    redirect '/'
  end
end

