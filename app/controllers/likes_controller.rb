class LikesController < ApplicationController

	def create
		@post = Post.find(params[:id])
		@like = Like.new(
			postId: params[:id],
			userId: @current_user.id
		)
		@like.save
	end

	def delete
		@post = Post.find(params[:id])
		@like = Like.find_by(
			postId: params[:id],
			userId: @current_user.id,
		)
		@like.destroy
	end

	# def post_detail_create
	# 	@post = Post.find(params[:id])
	# 	@like = Like.new(
	# 		postId: params[:id],
	# 		userId: @current_user.id
	# 	)
	# 	@like.save
	# end

	# def post_detail_delete
	# 	@post = Post.find(params[:id])
	# 	@like = Like.find_by(
	# 		postId: params[:id],
	# 		userId: @current_user.id,
	# 	)
	# 	@like.destroy
	# end

end