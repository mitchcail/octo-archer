class CreatePostUpdates < ActiveRecord::Migration
  def change
    create_table :post_updates do |t|
      t.text :content
      t.references :post, index: true

      t.timestamps
    end
  end
end
