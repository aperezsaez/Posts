class PostsController < ApplicationController
  def index
    @posts = Post.eager_load(:user, :likes).order(created_at: :desc).page params[:page]
    @post = Post.new
    @user_likes = Like.eager_load(:user, :post).where(user: current_user).pluck(:post_id)
  end

  def show
    @post = Post.find(params[:id]) #Encontramos post con cierto id
    @post_likes = @post.likes #encontramos a todos los likes del post []
  end
  

  def create
    @posts = Post.eager_load(:user, :likes).order(created_at: :desc).page params[:page]
    @post = Post.new(content: params[:post][:content])
    @post.user = current_user

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_path, notice: "Wena lo re creaste" }
      else
        format.html {render :index}
      end
    end    
  end

  def repost
    @post = Post.find(params[:id])
    new_post = Post.create(content: @post.content, user: current_user)
    @post.reposts << new_post
    redirect_to root_path
  end

end
