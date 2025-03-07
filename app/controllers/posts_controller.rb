class PostsController < ApplicationController
  http_basic_authenticate_with name: "oblivious", password: "password1", except: [:index, :show]
   
  def index
      @posts = Post.all
  end

  def show
      @post = Post.find(params[:id])
  end

  def edit
      @post = Post.find(params[:id])
  end
  
  def destroy
    @post.destroy
         
    redirect_to posts_path
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post].permit(:title,:text))

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
