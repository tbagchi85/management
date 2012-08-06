class CommentsController < ApplicationController
  before_filter :authorize_approve!, :only => [:create, :destroy]
  def create
    begin
      @post = Post.find(params[:post_id])
      @comment = @post.comments.create!(params[:comment])
      @comment.user_id = current_user.id
      @comment.save
      redirect_to @post
      flash[:notice] = "Successfully created a comment."
    rescue ActiveRecord::RecordInvalid => invalid
      flash[:alert] = invalid.record.errors.first[1]
    end
  end
  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @post }
      format.json { head :no_content }
    end
  end
end
