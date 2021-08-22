class CommentsController < ApplicationController

	def create
		postId = params.permit(:postId).values[0]
		@comment = Comment.new(comment_create)
		if @comment.save
			redirect_to("/post/#{postId}/detail")
		end
	end

	def comment_create
		params.permit(:content,:userId,:postId)
	end
end