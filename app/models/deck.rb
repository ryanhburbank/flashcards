class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds
  belongs_to :user

  validates :title, presence: true, uniqueness: true, length: {
                                                                in: 1..350,
                                                                too_short: "The text is too short!",
                                                                too_long: "The text is too long, must be shorter than 350 characters!"
                                                               }
  #validates_associated :user, { message: "Must belong to a User."}
end
