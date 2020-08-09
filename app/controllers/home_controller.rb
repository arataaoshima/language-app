class HomeController < ApplicationController

before_action :only_new, only: [:top]
before_action :authenticate_user, only: [:dashboard, :index, :profile, :update]
before_action :authenticate_admin!, only: [:index, :profile]

  def top
    @blogs = Blog.all
  end

  def about
  end

  def dashboard
    @interviews = Interview.paginate(page: params[:page], per_page: 3).order("updated_at DESC")
    @blogs = Blog.paginate(page: params[:page], per_page: 3).order("updated_at DESC")
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
    @user.payment = params[:payment]
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

    def authenticate_user
      if !user_signed_in?
        redirect_to root_path
      end
    end

    def authenticate_admin!
      authenticate_user!
      redirect_to dashboard_path  unless current_user.admin?
    end



end
