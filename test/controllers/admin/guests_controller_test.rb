# frozen_string_literal: true

require "test_helper"

class Admin::GuestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guest = guests(:joe_doe)
    admin_sign_in
  end

  test "should get index" do
    get admin_guests_url
    assert_response :success
  end

  test "should get new" do
    skip
    get new_admin_guest_url
    assert_response :success
  end

  test "should create guest" do
    skip
    assert_difference("Guest.count") do
      post admin_guests_url, params: { guest: {} }
    end

    assert_redirected_to admin_guest_url(Guest.last)
  end

  test "should show guest" do
    skip
    get admin_guest_url(@guest)
    assert_response :success
  end

  test "should get edit" do
    skip
    get edit_admin_guest_url(@guest)
    assert_response :success
  end

  test "should update guest" do
    skip
    patch admin_guest_url(@guest), params: { guest: {} }
    assert_redirected_to admin_guest_url(@guest)
  end

  test "should destroy guest" do
    skip
    assert_difference("Guest.count", -1) do
      delete admin_guest_url(@guest)
    end

    assert_redirected_to admin_guests_url
  end
end
