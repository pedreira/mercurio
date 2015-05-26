class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def self.from_omniauth(access_token)
    data = access_token.info
    email = data["email"]

    unless email.include? 'pedreira.com'
      raise "Invalid Domain"
    end

    if user = User.where(:email => email).first
      user
    else
      User.create!(:email => email, :password => Devise.friendly_token[0,20])
    end
  end
end
