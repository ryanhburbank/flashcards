class Card < ActiveRecord::Base
  belongs_to :deck

  validates :question, :answer, :deck_id, presence: true
  # Remember to create a migration!
end
