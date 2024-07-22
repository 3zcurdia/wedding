# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :set_current_request_details

  def current_guest = Current.guest
  helper_method :current_guest

  def validate_guest!
    Current.guest = Guest.find_by(id: session[:guest_id]) if session[:guest_id].present?
  end

  def invalidate_guest!
    Current.guest = nil
    session[:guest_id] = nil
  end

  def current_admin = Current.session_record if Current.session_admin?
  helper_method :current_admin

  def signed_in? = Current.session.present?
  helper_method :signed_in?

  def authenticate!
    if (session_record = Session.find_by(id: session_token))
      Current.session = session_record
    else
      redirect_to admin_sign_in_path, alert: "You must sign in first"
    end
  end

  private

  def set_current_request_details
    Current.user_agent = request.user_agent
    Current.ip_address = request.ip
  end

  def session_token
    cookies.signed[:session_token]
  end
end
