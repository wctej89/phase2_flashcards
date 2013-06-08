class Deck < ActiveRecord::Base
  has_many :rounds
  has_many :cards
  before_save :capitalize_name

  def find_next
    self.cards.where('correct = ?', false).sample
  end 

  def finished?
    !self.find_next
  end

  def reset
    self.cards.each do |card|
      card.correct = false
      card.save
    end
  end

  protected

  def capitalize_name
    self.name = self.name.capitalize
  end
end
