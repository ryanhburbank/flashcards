class Deck < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user

  validates :title, presence: true
  validates :title, uniqueness: true

end
