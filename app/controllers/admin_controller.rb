class AdminController < ApplicationController

  before_filter :setup

  def setup
    authorize! :manage, @users
  end

  def edit
    user = User.find_by_email(params[:email])
    user.admin = !user.admin
    user.save

    redirect_to root_url, notice: "Admin modified"
  end

end
