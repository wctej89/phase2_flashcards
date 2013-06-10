get '/deck/:deck_name/new_round' do |deck_name|
  @deck = Deck.find_by_name(deck_name)
  @round = Round.create(user_id: session[:user_id], deck_id: @deck.id )
  redirect "/deck/#{deck_name}/1"
end

get '/deck/:deck_name/:card_id' do |deck_name, card_id|
  @deck = Deck.find_by_name(deck_name)
  @card = Card.find(card_id)
  @verify = session[:verify]
  erb :card
end

post '/next/deck/:deck_name/:card_id' do |deck_name, card_id|
  content_type :json

  @deck = Deck.find_by_name(deck_name)
  @card = Card.find(card_id)
  user = current_user
  @round = user.rounds.last

  if @deck.finished?
    @deck.reset
    url = "/round/#{@round.id}"
  else
    @card = @deck.find_next
    url = "/deck/#{deck_name}/#{@card.id}"
  end
  url.to_json
end

post '/deck/:deck_name/:card_id/:user_answer' do |deck_name, card_id, user_answer|
  @deck = Deck.find_by_name(deck_name)
  @card = Card.find(card_id)
  user = current_user
  @round = user.rounds.last
  
  @guess = Guess.find_or_create_by_round_id_and_card_id(@round.id, card_id)
  @guess.increment_guesses
  @guess.mark_correct if @card.correct?(user_answer) 
  @card.answer
end

