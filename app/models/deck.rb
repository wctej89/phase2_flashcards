class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_many :cards

  def find_next
    self.cards.where('correct = ?', false).sample
  end 

  def reset
    self.cards.each do |card|
      card.correct = false
      card.save
    end
  end
end
