class PostsController < ApplicationController
  before_action:authenticate_user

  def new
    @maps = Map.all
    @post = Post.new
  end

  def create
    @maps = Map.all
    @post = Post.new(
      post_name: params[:post_name],
      mini_content: params[:mini_content],
      content: params[:content],
      map_id: params[:map_id],
      user_id: @current_user.id,
      post_image:"no_post_image.png"
    )

    if params[:image]
      @post.post_image = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.post_image}",image.read)
    end

    if @post.save
      flash[:success] = "投稿を作成しました"
      redirect_to("/")
    else
      flash.now[:danger] = "投稿を失敗しました"
      render "posts/new", status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.where(map_id: params[:map_name])
    @map_name = params[:map_name]
  end

  def show
    @posts = Post.all
    @edits = Edit.all
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: @post.user_id)
  end

  def edit
    @maps = Map.all
    @post = Post.find_by(id: params[:id])
  end

  def update
    @maps = Map.all
    @post = Post.find_by(id: params[:id])
    @post.mini_content = params[:mini_content]
    @post.content = params[:content]
    @post.map_id = params[:map_id]

    if params[:image]
      @post.post_image = "#{@post.id}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.post_image}",image.read)
    end

    if @post.save

      redirect_to ("/users/#{@post.id}/edits/new")
    else
      flash.now[:danger] = "編集を失敗しました"
      render "posts/edit", status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to("/")
  end
end