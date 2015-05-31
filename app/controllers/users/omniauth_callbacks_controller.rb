class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_oauth2
    omniauth = env["omniauth.auth"]

    begin

      @user = User.from_omniauth(omniauth)
      if @user and @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
        sign_in_and_redirect @user, :event => :authentication
      else
        flash[:alert] = I18n.t "devise.omniauth_callbacks.failure"
        redirect_to root_url
      end

    rescue Exception => e
      flash[:alert] = e.message
      redirect_to root_url
    end


  end

end
