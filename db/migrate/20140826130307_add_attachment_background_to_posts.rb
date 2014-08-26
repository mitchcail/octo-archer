class AddAttachmentBackgroundToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :background
    end
  end

  def self.down
    remove_attachment :posts, :background
  end
end
