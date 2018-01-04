# comment controller
class CommentsController < ApplicationController
	
	def create
		# when you click submit on new comments form it's a post which looks like this:
		# POST "/products/65/comments"
		@product = Product.find(params[:product_id])
		@comment = @product.comments.new(comment_params)
		@comment.user = current_user
		@comment.save
		redirect_to product_path(@product)
	end

	def destroy

	end

	private
		def comment_params
			params.require(:comment).permit(:user_id, :body, :rating)
		end

end
