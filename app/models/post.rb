class Post < ActiveRecord::Base

	has_many :comments, dependent: :destroy

	validates :title, :link, presence: true
	validates :description, length: { minimum:25 }

	#hacker news algorithm
	def frontpage_rank
		p = upvotes
		t = (Time.now - created_at).to_i / 60*2

		puts (p-1) / (t+2)**1.5
	end 
end
