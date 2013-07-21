class IncorrectAnswer < ActiveRecord::Base
  belongs_to :round
  belongs_to :card

  validates :attempt, presence: true
  validates_associated :card
  validates_associated :round
end
