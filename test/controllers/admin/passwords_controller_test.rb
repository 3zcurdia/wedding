# frozen_string_literal: true

require "test_helper"

class Admin::PasswordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = sign_in_as(admins(:lazaro_nixon))
  end

  test "should get edit" do
    get edit_password_url

    assert_response :success
  end

  test "should update password" do
    patch password_url,
          params: { password_challenge: "Secret1*3*5*", password: "Secret6*4*2*",
                    password_confirmation: "Secret6*4*2*" }

    assert_redirected_to root_url
  end

  test "should not update password with wrong password challenge" do
    patch password_url,
          params: { password_challenge: "SecretWrong1*3", password: "Secret6*4*2*",
                    password_confirmation: "Secret6*4*2*" }

    assert_response :unprocessable_entity
    assert_select "li", /Password challenge is invalid/
  end
end