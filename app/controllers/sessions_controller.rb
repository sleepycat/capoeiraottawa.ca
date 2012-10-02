class SessionsController < ApplicationController

  def index
    # render the login page
  end

  def create
    auth = request.env["omniauth.auth"]
    authentication = Authentication.find_with_omniauth(auth)
    if authentication
      #there is a user for this auth; let them in
      user = authentication.user
    else
      authentication = Authentication.create_from_omniauth(auth)
      user = authentication.user
    end
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
