class CommentsController < ApplicationController
  before_filter :login_required
  respond_to :html, :xml

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build

    respond_with(@comment)
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment has been created."
      redirect_to user_post_path(current_user,@post)
    else
      flash[:notice] = "Comment has not been created."
      render :action => "new"
    end
  end

end

