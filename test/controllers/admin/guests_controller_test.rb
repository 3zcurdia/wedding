# frozen_string_literal: true

require "test_helper"

class Admin::GuestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guest = guests(:one)
  end

  test "should get index" do
    get admin_guests_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_guest_url
    assert_response :success
  end

  test "should create guest" do
    assert_difference("Guest.count") do
      post admin_guests_url, params: { guest: {} }
    end

    assert_redirected_to admin_guest_url(Guest.last)
  end

  test "should show guest" do
    get admin_guest_url(@guest)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_guest_url(@guest)
    assert_response :success
  end

  test "should update guest" do
    patch admin_guest_url(@guest), params: { guest: {} }
    assert_redirected_to admin_guest_url(@guest)
  end

  test "should destroy guest" do
    assert_difference("Guest.count", -1) do
      delete admin_guest_url(@guest)
    end

    assert_redirected_to admin_guests_url
  end
end
