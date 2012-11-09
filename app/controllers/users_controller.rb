class UsersController < ApplicationController
  before_filter :require_login

  def home
    @user = User.find(current_user.id)
  end

  def index
    @page = params[:page] || 1
    @users = User.order("name").page(@page).per(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to users_path
    else
      render action: :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to users_path
    else
      render action: :edit
    end
  end

  def show
  end

  def destroy
  end

  private
  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_url
    end
  end

  def logged_in?
    !!current_user
  end
end
