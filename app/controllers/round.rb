get '/round/:round_id' do |round_id|
  @round = Round.find(round_id)
  @deck = Deck.find(@round.deck_id)
  @round_summary = Guess.sorted_round_summary(round_id)
  @accuracy = Guess.accuracy(round_id)
  erb :round_summary
end
