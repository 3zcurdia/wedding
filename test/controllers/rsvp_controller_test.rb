# frozen_string_literal: true

require "test_helper"

class RsvpControllerTest < ActionDispatch::IntegrationTest
  setup do
    post guests_access_url, params: { guest: { phone: guests(:joe_doe).phone } }
  end

  test "should get show" do
    get rsvp_url
    assert_response :success
  end

  test "should new" do
    get new_rsvp_url
    assert_response :success
  end

  test "should create rsvp" do
    guest = guests(:joe_doe)
    post rsvp_url, params: { guest: { phone: guest.phone, confirmed_plus_ones: 1 } }

    assert_redirected_to rsvp_url
    assert_not_nil guest.reload.confirmed_at
    assert_equal 1, guest.reload.confirmed_plus_ones
  end
end
