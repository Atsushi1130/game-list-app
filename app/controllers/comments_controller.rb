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

	def delete
		@comment = Comment.find_by(id: params[:commentId])
		if @comment.destroy
			redirect_to("/post/#{params[:postId]}/detail")
		end
	end
end