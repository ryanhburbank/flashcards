class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds
  # Remember to create a migration!
  belongs_to :user

  validates :title, presence: true
  validates :title, uniqueness: true

end
