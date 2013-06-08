require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :rounds
  validates :email, :password_hash, presence: true
  validates :email, uniqueness: true
  validate :email_is_a_valid_email_address


  def self.authenticate(params)
    @user = User.find_by_email(params[:email])
    if @user && @user.password == params[:password]
      return @user
    else
      return false
    end
  end

  def self.find_all_data(user_id)
    data_array = []
    User.find(user_id).rounds.each do |round|
      guesses = Guess.where('round_id = ?', round.id)
      score = guesses.sum('correct_count').to_f/guesses.sum('total_per_card')
      deck_name = round.deck.name
      data_array << [round.id, deck_name, score]
    end
    p data_array
  end


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def email_is_a_valid_email_address
    unless self.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      errors.add(:email, "is not a valid email (foo@bar.com)")
    end
  end
end
