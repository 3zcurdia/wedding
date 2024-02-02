# frozen_string_literal: true

require "test_helper"

class Guests::AccessesControllerTest < ActionDispatch::IntegrationTest
  test "must validate guest by phone" do
    guest = guests(:joe_doe)
    post guests_access_url, params: { guest: { phone: guest.phone } }
    assert_redirected_to details_url
  end

  test "must not validate invalid guest" do
    post guests_access_url, params: { guest: { phone: "0000000000" } }
    assert_redirected_to root_url
  end
end
