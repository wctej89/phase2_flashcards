class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_many :cards

  def find_next
    self.cards.where('correct = ?', false).sample
  end 

end
