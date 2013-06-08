class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card

  def self.round_summary(round_id)
    self.where('round_id = ?', round_id)
  end
  
  def self.sorted_round_summary(round_id)
    self.round_summary(round_id).sort_by! { |card| card.card_id }
  end

  def self.correct_cards(round_id)
    self.round_summary(round_id).sum('correct_count')
  end

  def self.total_guesses(round_id)
    self.round_summary(round_id).sum('total_per_card')
  end

  def self.accuracy(round_id)
    ((self.correct_cards(round_id).to_f / self.total_guesses(round_id)) * 100).to_i
  end

  def increment_guesses
    self.total_per_card += 1
    self.save
  end

  def mark_correct
    self.correct_count = 1
    self.save
  end
end
  
