class SessionsController < ApplicationController

  def index
    # render the login page
  end

  def create
    # FIXME - XXX this is a mess. The models are probably doing the wrong thing.
    auth = env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth["provider"], auth["uid"])
    user = authentication ? authentication.user : User.from_omniauth(auth)
    session[:user_id] = user.id
    flash[:notice]= t("logged_in")
    redirect_to root_url
  end

  def destroy
    session[:user_id]=nil
    flash[:notice]= t("logged_out")
    redirect_to root_url
  end

end
