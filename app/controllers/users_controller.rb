class UsersController < ApplicationController
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
end