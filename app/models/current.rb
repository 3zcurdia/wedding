# frozen_string_literal: true

class Current < ActiveSupport::CurrentAttributes
  attribute :guest
  attribute :session
  attribute :user_agent, :ip_address

  delegate :admin?, :user?, :record, to: :session, allow_nil: true, prefix: true

  def reset
    self.guest = nil
    self.session = nil
    self.user_agent = nil
    self.ip_address = nil
  end
end
