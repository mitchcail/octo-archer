class AddVotesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :upvotes, :integer
  end
end
