class Post < ActiveRecord::Base
	validates :title, :link, presence: true
	validates :description, length: { minimum:25 }
end
