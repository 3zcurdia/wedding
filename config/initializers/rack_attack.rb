# frozen_string_literal: true

# It will throlle requests to 6 requests per minute per IP
Rack::Attack.throttle("requests for guest access", limit: 6, period: 60) do |request|
  request.ip if request.path == "/guests/access" && request.post?
end
