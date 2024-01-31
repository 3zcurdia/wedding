# frozen_string_literal: true

class Current < ActiveSupport::CurrentAttributes
  attribute :session
  attribute :user_agent, :ip_address

  delegate :admin?, :user?, :record, to: :session, allow_nil: true, prefix: true
end
