class MakeRegistrationsAJoinTable < ActiveRecord::Migration
  def up
    Post.delete_all
    remove_column :comments, :name
    add_column :comments, :user_id, :integer
  end

  def down
    Post.delete_all
    remove_column :comments, :user_id
    add_column :comments, :name, :string
  end
end
