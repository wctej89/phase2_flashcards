get '/deck/:deck_name/new_round' do |deck_name|
  @deck = Deck.find_by_name(deck_name)
  @round = Round.create(user_id: session[:user_id], deck_id: @deck.id )
  redirect "/deck/#{deck_name}/1"
end

get '/deck/:deck_name/:card_id' do |deck_name, card_id|
  # @deck, @card = get_deck_card(deck_name, card_id)
  @deck = Deck.find_by_name(deck_name)
  @card = Card.find(card_id)
  @verify = session[:verify]
  erb :card
end

post '/next/deck/:deck_name/:card_id' do |deck_name, card_id|
  content_type :json

  user, round, deck, card = get_info(deck_name, card_id)
  url = deck.get_url(round.id, card.id)
  url.to_json
end

post '/deck/:deck_name/:card_id/:user_answer' do |deck_name, card_id, user_answer|
  user, round, deck, card = get_info(deck_name, card_id)
  
  Guess.mark_if_correct(round, card, user_answer)

  card.answer
end

