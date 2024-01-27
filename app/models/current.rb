# frozen_string_literal: true

class Current < ActiveSupport::CurrentAttributes
  attribute :session
  attribute :user_agent, :ip_address

  def admin = session&.record if admin?
  def user = session&.record if user?

  def admin?
    session&.record_type == "Admin"
  end

  def user?
    session&.record_type == "User"
  end
end
