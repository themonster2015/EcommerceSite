class CommentsController < ApplicationController
	def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    logger.debug "Text of the new Comment: #{@comment.body}"
    @comment.user = current_user
    @user = current_user
   # @user = request.env['warden'].user
    #just added
     # @comments = @product.comments.order(:id).paginate(:page => params[:page], :per_page => 5)
    respond_to do |format|
      if @comment.save

        # ActionCable.server.broadcast 'product_channel', comment: @comment, average_rating: @comment.product.average_rating
       # ProductChannel.broadcast_to @product.id, comment: @comment, average_rating: @product.average_rating
        #ProductChannel.broadcast_to @product.id, comment: CommentsController.render(partial: 'comments/comment', locals: {comment: @comment, current_user: current_user}), average_rating: @product.average_rating

        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
        format.js 
      else
        format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  @comment = Comment.find(params[:id])
  product = @comment.product
  @comment.destroy
  redirect_to product
  end
  private

  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

end
