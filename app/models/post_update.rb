class PostUpdate < ActiveRecord::Base
  belongs_to :post

  validate :content, presence: true
end
