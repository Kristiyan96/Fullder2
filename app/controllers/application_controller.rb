# frozen_string_literal: true
require 'application_responder'
class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception
  helper_method :current_order
  before_action :set_locale
  include CanCan::ControllerAdditions

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_path
  end

  def current_order
    if !session[:order_id].nil? && Order.exists?(session[:order_id])
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def current_ability
    Ability.new(current_user, controller_path.split('/').first)
  end

  def set_locale
    I18n.locale = current_user&.locale || params[:locale] || cookies[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
    cookies.permanent[:locale] = I18n.locale
  end

 def default_url_options(options={})
   logger.debug "default_url_options is passed options: #{options.inspect}\n"
   { locale: I18n.locale }
 end
end
