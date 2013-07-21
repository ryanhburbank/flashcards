class IncorrectAnswer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :round
  belongs_to :card

  validates :answer, presence: true
end
