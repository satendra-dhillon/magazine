class Comment < ActiveRecord::Base


  belongs_to :commentable, polymorphic: true
	has_many :replies, class_name: "Comment", foreign_key: "parent_comment_id", dependent: :destroy
  belongs_to :parent_comment, class_name: "Comment", foreign_key: "parent_comment_id"


	belongs_to :commenter, class_name: "User"
	belongs_to :blog
end
