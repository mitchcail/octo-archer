class Post < ActiveRecord::Base

	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
	has_many :likers, through: :likes, source: :user
	has_many :post_updates, dependent: :destroy

	has_many :activities

	belongs_to :user

	has_attached_file :background, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :background, :content_type => /\Aimage\/.*\Z/

	validates :title, :link, presence: true
	validates :description, length: { minimum:25 }

	#hacker news algorithm
	def frontpage_rank
		p = upvotes
		t = (Time.now - created_at).to_i / 60*2

		puts (p-1) / (t+2)**1.5
	end 

	def upvote
		self.upvotes = 0 if upvotes.nil?
		self.upvotes += 1
		puts upvotes
	end

	def total_upvotes
		if upvotes.nil?
			return 0
		else
			upvotes
		end
	end

end
