class Blog < ActiveRecord::Base
	has_many :ratings, class_name: "Rating", foreign_key: :blog_id
	has_many :comments, class_name: "Comment", foreign_key: :comment_id


	def average_rating
		self.ratings.map(&:score).sum.to_f/self.ratings.count if self.ratings.count>0
	end

end
