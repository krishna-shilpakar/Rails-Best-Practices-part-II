class PostsController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  respond_to :html, :xml

  def index
    @posts = Post.all
    # show all posts that have more than 10 comments
    @popular_posts = @posts.collect{|p| p if p.comments.size > 10}.compact
    
    respond_with(@posts)
  end

  def new
    @post = Post.new

   respond_with(@post)
  end

  def create
    @post = Post.new(params[:post])
    flash[:notice] = "Post has been created." if @post.save
    respond_with(@posts, :location => user_post_path(current_user, @post))
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new

   respond_with(@post)
  end

end

