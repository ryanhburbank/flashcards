class Guess < ActiveRecord::Base
  belongs_to :user, :card
  # Remember to create a migration!
end
