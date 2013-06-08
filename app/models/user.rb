require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :rounds
  validates :email, :password_hash, presence: true
  validates :email, uniqueness: true
  validate :email_is_a_valid_email_address

  def self.find_all_scores(user_id)
    score_array = []
    User.find(user_id).rounds.each do |round|
      score = Guess.accuracy(round.id)
      deck_name = round.deck.name
      score_array << [round.id, deck_name, score]
    end
    score_array
  end

  def self.authenticate(params)
    @user = User.find_by_email(params[:email])
    (@user) && (@user.password == params[:password]) ? @user : false
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  protected

  def email_is_a_valid_email_address
    unless self.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      errors.add(:email, "is not a valid email (foo@bar.com)")
    end
  end
end
