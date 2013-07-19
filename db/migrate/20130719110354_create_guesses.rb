class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :query
      t.belongs_to :user
      t.belongs_to :card
      t.timestamps
    end
  end
end
