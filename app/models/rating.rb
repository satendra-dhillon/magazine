class Rating < ActiveRecord::Base
	belongs_to :rater, class_name: "User"
	belongs_to :blog



end
