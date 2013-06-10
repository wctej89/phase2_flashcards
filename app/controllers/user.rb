get '/' do
  @errors = []
  @decks = Deck.all
  if logged_in?
    user = current_user 
  end
  erb :home
end

post '/users' do
  if params[:user][:password] == params[:password_confirmation]
    @user = User.create(params[:user])
    @errors = @user.errors.full_messages unless @user.valid?
    create_session(@user)
  else
    @errors = ["Password and confirmation do not match"]
  end
  @decks = Deck.all
  erb :home
end

post '/sessions' do
  @user = User.authenticate(params[:user]) if params[:user][:email]
  if @user
    create_session(@user)
  else
    @errors = ["Invalid email or password"]
  end
  @decks = Deck.all
  erb :home
end

get '/sessions/:id' do
  session.clear
  redirect '/'
end

get '/users/:id' do
  @data = User.find_all_scores(params[:id])
  erb :_scoreboard
end


