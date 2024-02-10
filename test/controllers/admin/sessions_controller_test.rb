# frozen_string_literal: true

require "test_helper"

class Admin::SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = admin_users(:lazaro_nixon)
  end

  test "should get index" do
    admin_sign_in

    get admin_sessions_url

    assert_response :success
  end

  test "should get new" do
    get admin_sign_in_url

    assert_response :success
  end

  test "should sign in" do
    post admin_sign_in_url, params: { email: @admin.email, password: "Secret1*3*5*" }

    assert_redirected_to admin_url

    get root_url

    assert_response :success
  end

  test "should not sign in with wrong credentials" do
    post admin_sign_in_url, params: { email: @admin.email, password: "SecretWrong1*3" }

    assert_redirected_to admin_sign_in_url(email_hint: @admin.email)
    assert_equal "That email or password is incorrect", flash[:alert]

    get admin_url

    assert_redirected_to admin_sign_in_url
  end

  test "should sign out" do
    admin_sign_in

    delete admin_session_url(@admin.sessions.last)

    assert_redirected_to admin_sessions_url

    follow_redirect!

    assert_redirected_to admin_sign_in_url
  end
end
