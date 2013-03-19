class CommentsController < ApplicationController
  def create
    @comment_hash = params[:comment]
    @obj = @comment_hash[:commentable_type].constantize.find(@comment_hash[:commentable_id])
    # Not implemented: check to see whether the user has permission to create a comment on this object
    @comment = Comment.build_from(@obj, current_user.id, @comment_hash[:body])
    if @comment.save
      flash[:success] = "Comment saved"
      render :partial => "comments/comment", :locals => { :comment => @comment }, :layout => false, :status => :created
    else
      flash[:error] = "Comment not saved"
      #can replace with a flash message. 
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    #  flash[:success] = "Comment removed"
      #can replace with a flash message. 
    #else
    #  flash[:error] = "Error in removing comment"
      #can replace with a flash message. 
    #end
  end
end
