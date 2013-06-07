get '/login' do
 erb :home_login
end

post '/login' do
  @user = User.authenticate(params) if params[:email]
  session[:user_id] = @user.id if @user
  redirect '/'
end
