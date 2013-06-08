get '/' do
 @decks = Deck.all
 user = current_user if logged_in?
 @qdata = User.find_all_data(user)
 erb :home
end

post '/users' do
  if params[:user][:password] == params[:password_confirmation]
    @user = User.create(params[:user])
    p @user.errors.full_messages unless @user.valid?
    create_session(@user)
  else
    p "password and confirmation do not match"
  end
  redirect '/'
end

post '/sessions' do
  @user = User.authenticate(params[:user]) if params[:user][:email]
  if @user
    create_session(@user)
  else
    p 'invalid email or password'
  end
  redirect '/'
end

get '/sessions/:id' do
  session.clear
  redirect '/'
end
