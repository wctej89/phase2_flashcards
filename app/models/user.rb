require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  has_many :rounds

  def self.authenticate(params)
    p params
    @user = User.find_by_email(params[:email])
    if @user && @user.password == params[:password]
      return @user
    else
      return false
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
