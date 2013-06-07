class Deck < ActiveRecord::Base
  # Remember to create a migration!
  has_many :rounds
  has_many :cards
end
