class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  helper_method :current_user

  def set_locale
#    if  I18n.available_locales.include? params[:locale].to_sym
      I18n.locale= params[:locale].nil? ? :en : params[:locale].to_sym
#    else
#      I18n.locale = :en
#    end
  end

  def events
    @events = Event.order('start_date desc').limit(2)
  end

  def locations
    @locations = Location.all
    @locations.each{|loc| loc.practices}
  end

  def self.default_url_options
    { :locale => I18n.locale }
  end

  def current_user
    @current_user =  session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def authorize
    redirect_to login_path, alert: t("not_authorized") unless current_user && current_user.has_role?(:admin)
  end
end
