class Round < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :deck

  validate :query, :user_id, :deck_id, presence: true

end
