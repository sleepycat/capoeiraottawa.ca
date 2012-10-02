class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  helper_method :current_user, :admin_user?

  def set_locale
#    if  I18n.available_locales.include? params[:locale].to_sym
      I18n.locale= params[:locale].nil? ? :en : params[:locale].to_sym
#    else
#      I18n.locale = :en
#    end
  end

  def self.default_url_options
    { :locale => I18n.locale }
  end

  def current_user
    @current_user =  session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def admin_user?
    current_user.nil? ? false : current_user.has_role?(:admin)
  end


  def authorize
    redirect_to login_path, notice: t("not_authorized") unless admin_user?
  end
end
