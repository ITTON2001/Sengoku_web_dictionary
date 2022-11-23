class UsersController < ApplicationController
  before_action:authenticate_user,{only:[:index,:show,:edit,:update]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  before_action :ensure_correct_user, {only: [:edit, :update]}

  #ユーザーの一覧を表示
  def index
    @users = User.all
  end

  #ユーザーデータの表示
  def show
    @posts = Post.all
    @user = User.find_by(id: params[:id])
  end

  #ユーザーの新規作成
  def new
    @user = User.new
  end

  #ユーザーがタメになったを押した投稿を閲覧可能にする
  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  #新規ユーザーをdbに登録する
  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      image_name:"no_user_image.jpg",
      password: params[:password]
      )
      if params[:image]
        @user.image_name = "#{@user.id}.jpg"
        image = params[:image]
        File.binwrite("public/user_images/#{@user.image_name}",image.read)
      end
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました！"
      redirect_to("/users/#{@user.id}")
    else
      render "users/new", status: :unprocessable_entity
    end
  end

  #ユーザーを編集する
  def edit
    @user = User.find_by(id: params[:id])
  end

  #ユーザーの編集したものをdbに登録する
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.Introduce = params[:Introduce]

    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end

    if @user.save
      flash[:notice] = "ユーザー情報を編集しました"
      redirect_to("/users/#{@user.id}")
    else
      render "users/edit", status: :unprocessable_entity
    end
  end

  #ログインフォームを作る
  def login_form
  end

  #ログイン機能
  def login
    @user = User.find_by(email: params[:email],
                         password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to ("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render "users/login_form", status: :unprocessable_entity
    end
  end

  #ログアウト機能
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
end
