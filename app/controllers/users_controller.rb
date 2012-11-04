class UsersController < ApplicationController
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
end
