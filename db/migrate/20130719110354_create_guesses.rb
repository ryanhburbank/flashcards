class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.belongs_to :round
      t.belongs_to :card
      t.string     :attempt
      t.boolean    :is_correct, :default => false 
      t.timestamps
    end
  end
end

# Comment
#   belongs_to :commentable, polymorphic: true
# end

# Post
#   has_many :comments, as: :commentable
# end

# Picture
#   has_many :comments, as: :commentable
# end

# p = Post.find(1)
# p.comments #select * from comments where commentable_type "Post", commentable_id 1
