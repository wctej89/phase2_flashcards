get '/deck/:deck_name/new_round' do |deck_name|
  deck = Deck.find_by_name(deck_name)
  @round = Round.create(user_id: session[:user_id], deck_id: deck.id )
  redirect "/deck/#{deck_name}/1"
end

get '/deck/:deck_name/:card_id' do |deck_name, card_id|
  @deck = Deck.find_by_name(deck_name)
  @card = Card.find(card_id)
  @verify = session[:verify]
  erb :card
end

post '/deck/:deck_name/:card_id' do |deck_name, card_id|
  @deck = Deck.find_by_name(deck_name)
  @card = Card.find(card_id)

  user = current_user
  @round = user.rounds.last
  @guess = Guess.find_or_create_by_round_id_and_card_id(@round.id, card_id)
  @guess.total_per_card += 1
  @guess.save

  if @card.correct?(params[:answer]) 
    session[:verify] = "Yes, your answer was correct!"
    @guess.correct_count += 1
    @guess.save
  else 
    session[:verify] = "No, your answer was incorrect. Correct answer was #{@card.answer}."
  end

  if @deck.find_next
    @card = @deck.find_next
    redirect to("/deck/#{deck_name}/#{@card.id}")
  else
    @deck.reset
    redirect "/round/#{@round.id}"
  end

end

get '/round/:round_id' do |round_id|
  @round = Round.find(round_id)
  @deck = Deck.find(@round.deck_id)
  @deck_name = @deck.name
  @round_summary = Guess.where('round_id = ?', round_id)
  @round_summary.sort_by! { |card| card.card_id }
  @total_correct_cards = @round_summary.sum('correct_count')
  @total_guesses = @round_summary.sum('total_per_card')
  @accuracy = ((@total_correct_cards.to_f / @total_guesses) * 100).to_i
  erb :done
end
