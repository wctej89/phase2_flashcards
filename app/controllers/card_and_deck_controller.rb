get '/deck/:deck_name/:card_id' do |deck_name, card_id|
  @deck = Deck.find_by_name(deck_name)
  @card = Card.find(card_id)
  @verify = session[:verify]
  erb :card
end

post '/deck/:deck_name/:card_id' do |deck_name, card_id|
  @deck = Deck.find_by_name(deck_name)
  @card = Card.find(card_id)

  round_id = @current_user.rounds.last
  guess = Guess.find_or_create_by_round_id_and_card_id(round_id, card_id)
  guess.total_per_card += 1
  guess.save

  if @card.correct?(params[:answer]) 
    session[:verify] = "Yes, your answer was correct!"
  else 
    session[:verify] = "No, your answer was incorrect. Correct answer was #{@card.answer}."
  end

  if @deck.find_next
    @card = @deck.find_next
    redirect to("/deck/#{deck_name}/#{@card.id}")
  else
    @deck.reset
    erb :done
  end

end
