class Card < ActiveRecord::Base
  has_many :guesses
  belongs_to :deck
  has_many :incorrect_answers

  validates :question, :answer, :deck_id, presence: true
end
