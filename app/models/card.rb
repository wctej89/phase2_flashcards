class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses 

  def correct?(answer)
    if answer.downcase == self.answer.downcase
      self.correct = true
      self.save
    end
  end
end
