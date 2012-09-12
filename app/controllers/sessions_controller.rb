class SessionsController < ApplicationController

  def index
    # render the login page
  end

  def create
    auth = env["omniauth.auth"]
    authentication = Authentication.find_or_create_by_provider_and_uid(auth["provider"], auth["uid"])
    user = authentication.user || User.from_omniauth(auth)
    session[:user_id] = user.id
    flash[:info]= t("logged_in")
    redirect_to root_url
  end

  def destroy
    session[:user_id]=nil
    flash[:info]= t("logged_out")
    redirect_to root_url
  end

end
