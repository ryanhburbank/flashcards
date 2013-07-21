class Card < ActiveRecord::Base

  has_many :incorrect_answers
  belongs_to :deck

  validates :question, presence: true, length: {
                                              in: 1..255,
                                              too_short: "The text is too short!",
                                              too_long: "The text is too long, must be shorter than 255 characters."
                                            }
  validates :answer, presence: true, length: {
                                             in: 1..255,
                                             too_short: "The text is too short!",
                                             too_long: "The text is too long, must be shorter than 255 characters."
                                            }
  validates_associated :deck, presence: {message: "A card must be part of a Deck."}
end
