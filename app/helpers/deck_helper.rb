def get_info(deck_name, card_id)
  user = current_user
  round = user.rounds.last
  deck = Deck.find_by_name(deck_name)
  card = Card.find(card_id)

  return user, round, deck, card
end

def get_deck_card_(deck_name, card_id)
  deck = Deck.find_by_name(deck_name)
  card = Card.find(card_id)

  return deck, card
end