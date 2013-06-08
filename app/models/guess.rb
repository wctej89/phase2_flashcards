class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card

  def self.round_summary(round_id)
    self.where('round_id = ?', round_id)
  end

  def self.sorted_round_summary(round_id)
    self.round_summary(round_id).sort_by! { |card| card.card_id }
  end

  def self.total_correct_cards(round_id)
    self.round_summary(round_id).sum('correct_count')
  end

  def self.total_guesses(round_id)
    self.round_summary(round_id).sum('total_per_card')
  end

  def self.accuracy(round_id)
    ((self.total_correct_cards(round_id).to_f / self.total_guesses(round_id)) * 100).to_i
  end

  def self.increment_guess(round_id, card_id)
    guess.total_per_card += 1
    guess.save
  end
end
  
