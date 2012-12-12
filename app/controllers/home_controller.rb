class HomeController < ApplicationController
  
  def index
    if user_signed_in? and !current_user.admin?
      redirect_to :medias
    end
  end
  
  def construcao
  end
  
end
