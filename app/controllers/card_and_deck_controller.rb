enable :sessions

get '/deck/:deck_name/:card_id' do |deck_name, card_id|
  @deck = Deck.find_by_name(deck_name)
  @card = Card.find(card_id)
  @verify = session[:verify]
  erb :card
end

post '/deck/:deck_name/:card_id' do |deck_name, card_id|
  @deck = Deck.find_by_name(deck_name)
  @card = Card.find(card_id)

  #Need access to the user...so that we can get the round
  # guess = Guess.where('round_id = ? and card_id = ?', round_id, card_id)
  # total_per_card = guess.total_per_card + 1
  # guess.update_attributes(total_per_card: total_per_card)

  if @card.correct?(params[:answer]) 
    session[:verify] = "Yes, your answer was correct!"
  else 
    session[:verify] = "No, your answer was incorrect"
  end

  if @deck.find_next
    @card = @deck.find_next
    redirect to("/deck/#{deck_name}/#{@card.id}")
  else
    erb :done
  end

end
