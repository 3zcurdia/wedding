# frozen_string_literal: true

require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  teardown do
    Current.reset
  end

  test "should get home" do
    get root_url

    assert_response :success
  end

  test "should get details when guest is present" do
    post guests_access_url, params: { guest: { phone: guests(:joe_doe).phone } }
    get details_url

    assert_response :success
  end
end
