class Guess < ActiveRecord::Base
  belongs_to :user
  belongs_to :card

  validate :query, :user_id, :card_id, presence: true
  # Remember to create a migration!
end
