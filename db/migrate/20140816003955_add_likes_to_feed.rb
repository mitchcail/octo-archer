class AddLikesToFeed < ActiveRecord::Migration
  def change
    add_column :feeds, :likes, :has_many
  end
end
