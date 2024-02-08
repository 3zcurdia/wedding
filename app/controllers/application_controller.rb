# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :set_current_request_details

  def current_guest = Current.guest
  helper_method :current_guest

  def validate_guest!
    if (guest = Guest.find_by(id: session[:guest_id]))
      Current.guest = guest
    else
      redirect_to root_path, alert: "Unable to access this page"
    end
  end

  def current_admin = Current.record if Current.session_admin?
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
