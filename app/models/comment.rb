class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  RATING = [1,2,3,4,5]

end
