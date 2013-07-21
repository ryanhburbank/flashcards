enable :sessions


get '/user/register' do
  erb :'/user/new'
end

post '/user/register' do
  @current_user = User.new(email: params[:user][:email], first_name: params[:user][:first_name],
                           last_name: params[:user][:last_name], password: params[:user][:password], password_confirmation: params[:user][:password_confirmation])
  @current_user.save
  if @current_user.id
    session[:id] = @current_user.id
    redirect to('/user/portal')
  else
    "#{@current_user.errors.each {|error| flash[:error] = error }}"
    redirect to ('/user/register')
  end
end

get '/user/profile' do
  erb :'/user/profile'
end

post '/user/login' do
  @current_user = User.find_by_email(params[:user][:email])
  if @current_user.authenticate(params[:user][:password])
    session[:id]= @current_user.id
    redirect to('/user/portal')
  else
    flash[:error] = "Login failed! Please try again!"
    redirect to('/')
  end
end

get '/user/logout' do
  session[:id] = nil
  redirect to ("/")
end


#put this in helpers, can be used in 

get '/user/portal' do
  @current_user = User.find_by_id(session[:id])
  if @current_user
  # puts "current user at /:id #{@current_user}"
    erb :'/user/portal'
  else 
    redirect to('/login')
  end
end

