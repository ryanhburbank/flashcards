class Round < ActiveRecord::Base
  belongs_to :deck, :user
  # Remember to create a migration!
end
