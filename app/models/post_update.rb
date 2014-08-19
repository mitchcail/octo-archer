class PostUpdate < ActiveRecord::Base
  belongs_to :post
  has_many :updates, dependent: :destroy

  validate :content, presence: true
end
