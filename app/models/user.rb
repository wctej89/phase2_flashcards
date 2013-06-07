class User < ActiveRecord::Base
  has_many :rounds
  # Remember to create a migration!
end
