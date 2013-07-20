
get '/user/register' do
  erb :'/user/new'
end

post '/user/register' do
  redirect to('/user/params[:id]')
end

get '/user/profile' do
  erb :'/user/profile'
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :'/user/portal'
end

get '/user/login' do
  # get login form
end

post '/user/login' do
  # validate user
  session[:user_id] = user.id
  redirect to('/')
end


#put this in helpers, can be used in 

def current_user
  @current_user ||= User.find_by_id(session[:user_id])
end


