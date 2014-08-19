class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :trackable, polymorphic: true
  #attr_accessible :action, :trackable
  
end
