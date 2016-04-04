class Blog < ActiveRecord::Base
	has_many :ratings, class_name: "Rating", foreign_key: :blog_id


	def average_rating
		self.ratings.map(&:score).sum.to_f/self.ratings.count if self.ratings.count>0
	end

end
