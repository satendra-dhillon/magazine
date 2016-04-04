class Comment < ActiveRecord::Base
	# has_many :replies, class: "Comment", foreign_key: "reply_id"
	has_many :parent, :class_name => "Comment" 
  belongs_to :child, :class_name => "Comment"
  has_many :replies, :class_name => "Comment"
  belongs_to :parent_comment, :class_name => "Comment",:foreign_key => "parent_comment_id"

	belongs_to :commenter, class_name: "User"
	belongs_to :blog
end
