class HomeController < ApplicationController
  def top
  end

  def about
  end

  def index
    @users = User.all
  end

end
