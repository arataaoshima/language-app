class HomeController < ApplicationController

before_action :only_new, only: [:top]

  def top
  end

  def about
  end

  def dashboard

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def only_new
      if user_signed_in?
        redirect_to dashboard_path
      end
    end


end
