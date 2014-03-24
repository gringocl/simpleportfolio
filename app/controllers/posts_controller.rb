class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update]

  def index
    if current_user
      @posts = Post.order(created_at: :desc)
    else
      @posts = Post.where(published: true).order(created_at: :desc)
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create post_params
    if @post.save
      redirect_to @post, notice: "Post was created successfully!"
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was updated successfully!"
    else
      render :edit
    end
  end

  private

    def post_params
      params.require(:post).permit(:title, :body, (:published if current_user))
    end

    def set_post
      @post = Post.find params[:id]
    end
end
