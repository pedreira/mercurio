class AdminsController < ApplicationController

  before_filter :setup

  def setup
    authorize! :manage, @users
  end

  def index
    @users = User.find(:all, :order => "email")
  end

  def edit
    user = User.find_by_id(params[:id])
    user.admin = !user.admin
    user.save

    redirect_to :admins, notice: "Admin #{user.email} modified"
  end

end
