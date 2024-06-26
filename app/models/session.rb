# frozen_string_literal: true

class Session < ApplicationRecord
  belongs_to :record, polymorphic: true

  before_create do
    self.user_agent = Current.user_agent
    self.ip_address = Current.ip_address
  end

  def admin? = record_type == "AdminUser"
  def user? = record_type == "User"
end
