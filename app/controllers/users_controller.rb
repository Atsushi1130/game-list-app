class UsersController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
    @kaminari_data = Post.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    if @user.save
      flash[:notice] = "アカウントの作成に成功しました"
      session[:user_id] = @user.id
      redirect_to("/")
    end
  end

  def login_form
    @user = User.new
  end

  def login
    @user = User.find_by(
      email: params[:email],
      password: params[:password],
    )
    if @user
      flash[:notice] = "ログインに成功しました"
      session[:user_id] = @user.id
      redirect_to("/")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end

  def detail
    @user = User.find_by(id: params[:id])
    @posts = Post.where(userId: @user.id).order(created_at: :desc)
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(10)
  end

  def likes
    @user = User.find_by(id: params[:id])
    @likes = Like.where(userId: @user.id).order(created_at: :desc)
    @likes = Kaminari.paginate_array(@likes).page(params[:page]).per(10)
  end

  def nec_login
  end
end
