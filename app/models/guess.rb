class Guess < ActiveRecord::Base
  belongs_to :round
  belongs_to :card

  validates :query, :user, :card, presence: true
  validates :attempt, presence: true, length: {
                                                in: 1..255,
                                                too_short: "Your answer is too short!",
                                                too_long: "Your answer is too long, must be shorter than 350 characters!"
                                               }
end
