# comment controller
class CommentsController < ApplicationController
	
	def create
		# when you click submit on new comments form it's a post which looks like this:
		# POST "/products/65/comments"
		@product = Product.find(params[:product_id])
		@comment = @product.comments.new(comment_params)
		@comment.user = current_user
		
		# validation
		# @comment.save
		# redirect_to product_path(@product)
		respond_to do |format|
			if @comment.save
				format.html { redirect_to @product, notice: 'Review was created successfully.' }
				format.json { render :show, status: :created, location: @product }
			else
				format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
				format.json { render json: @comment.errors, status: :unprocessable_entity }
			end
		end

	end

	def destroy

	end

	private
		def comment_params
			params.require(:comment).permit(:user_id, :body, :rating)
		end

end