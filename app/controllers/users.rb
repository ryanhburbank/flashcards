
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
