class CreateIncorrectAnswers < ActiveRecord::Migration
  def change
    create_table :incorrect_answers do |t|
      t.belongs_to :round
      t.belongs_to :card
      t.string :answer

      t.timestamps
    end
  end
end
