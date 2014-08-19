class AddPostToActivities < ActiveRecord::Migration
  def change
    add_reference :activities, :post, index: true
  end
end
