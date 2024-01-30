# frozen_string_literal: true

require "test_helper"

class Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = admin_users(:lazaro_nixon)
  end

  test "should get index" do
    skip
    admin_sign_in_as @admin

    get sessions_url

    assert_response :success
  end

  test "should get new" do
    skip
    get admin_sign_in_url

    assert_response :success
  end

  test "should sign in" do
    skip
    post admin_sign_in_url, params: { email: @admin.email, password: "Secret1*3*5*" }

    assert_redirected_to root_url

    get root_url

    assert_response :success
  end

  test "should not sign in with wrong credentials" do
    skip
    post admin_sign_in_url, params: { email: @admin.email, password: "SecretWrong1*3" }

    assert_redirected_to admin_sign_in_url(email_hint: @admin.email)
    assert_equal "That email or password is incorrect", flash[:alert]

    get root_url

    assert_redirected_to sign_in_url
  end

  test "should sign out" do
    skip
    admin_sign_in_as @admin

    delete session_url(@admin.sessions.last)

    assert_redirected_to sessions_url

    follow_redirect!

    assert_redirected_to sign_in_url
  end
end
