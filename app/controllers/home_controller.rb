class HomeController < ApplicationController
  def top
  end

  def about
  end

  def index
    @users = User.all
  end

  def profile
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.admin = params[:admin]
    if @user.save
      redirect_to "/home/index"
    else
      render 'profile'
    end

  end


end
