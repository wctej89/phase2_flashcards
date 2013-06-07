get '/' do
 erb :home
end

post '/users' do
  @user = User.create(params[:user])
  create_session(@user)
  redirect '/'
end

post '/sessions' do
  @user = User.authenticate(params[:user]) if params[:user][:email]
  create_session(@user)
  redirect '/'
end

get '/sessions/:id' do
  # @user = User.find(params[:id])
  # sessions[@user.id].clear
  session.clear
  redirect '/'
end
