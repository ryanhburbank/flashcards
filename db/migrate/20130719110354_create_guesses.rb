class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.string :query
      t.belongs_to :user, polymorphic: true
      t.belongs_to :card
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
