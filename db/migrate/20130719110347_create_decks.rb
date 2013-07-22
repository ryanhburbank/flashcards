class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :title
      t.belongs_to :user
      t.has_many :cards

      t.timestamps
    end
  end
end
