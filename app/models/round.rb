class Round < ActiveRecord::Base

  belongs_to :user
  belongs_to :deck
  has_many :guesses

  # validates_associated :user, { message: "A round must belong to a User." }
  # validates_associated :deck, { message: "A round must belong to a deck." }

end
