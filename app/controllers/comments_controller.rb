class CommentsController < ApplicationController
  def index
 		@comments = Comment.all.order("created_at DESC")
  end

  def create
  	#does redirect_to transport instance variable to views
  	# @comments = Comment.create(comment_params)
  	p = Product.find(params[:id])
  	comment = Comment.new(comment_params)
  	puts comment.inspect
  	puts "%%%%%%%%%%%%%%"
		flash[:error] = "Comment cannot be empty" unless comment.save
		redirect_to "/products/#{params[:id]}"
  end
		

  private
  def comment_params
  	params.require(:comment).permit(:comment,:product_id)
  end
end
 




