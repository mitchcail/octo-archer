class AddFieldsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :description, :string
  end
end
