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

  def get_url(round_id, card_id)
    if self.finished?
      self.reset
      url = "/round/#{round_id}"
    else
      card = self.find_next
      url = "/deck/#{self.name}/#{card.id}"
    end
    url
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
