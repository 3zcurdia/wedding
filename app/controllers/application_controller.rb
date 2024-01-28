# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_current_request_details

  def current_admin = Current.record if Current.session_admin?
  helper_method :current_admin

  def authenticate!
    if (session_record = Session.find_by(id: cookies.signed[:session_token]))
      Current.session = session_record
    else
      redirect_to root_path, alert: "You must sign in first"
    end
  end

  private

  def set_current_request_details
    Current.user_agent = request.user_agent
    Current.ip_address = request.ip
  end
end
