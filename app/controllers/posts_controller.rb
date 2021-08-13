class PostsController < ApplicationController
  def index
    @posts = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  # def like
  #   @post = Post.all.find(post_params)
  #   Like.create(user_id: current_user.id, post_id: @post.id)
  #   redirect_to posts_path(@post)
  # end

  def create
    @post = Post.new(post_params)

    if @post.save
      respond_to do |format|
        format.html.tablet {
          redirect_to @post, notice: "Post was successfully created ON PHONE"
        }
        redirect_to @post
      end
    else
      render 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path

  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
