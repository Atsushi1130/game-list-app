class LikesController < ApplicationController

	def create
		@like = Like.new(
			postId: params[:id],
			userId: @current_user.id
		)
		@like.save
		redirect_to("/post/#{params[:id]}/detail")
	end

	def delete
		@like = Like.find_by(
			postId: params[:id],
			userId: @current_user.id,
		)
		@like.destroy
		redirect_to("/post/#{params[:id]}/detail")
	end

end