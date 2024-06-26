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
    get new_admin_guest_url
    assert_response :success
  end

  test "should create guest" do
    assert_difference("Guest.count") do
      valid_attributes = { first_name: "Test", last_name: "LastNane", phone: "55-55-55-5555", plus_ones_count: 2 }
      post admin_guests_url, params: { guest: valid_attributes }
    end

    assert_redirected_to admin_guests_url
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
    patch admin_guest_url(@guest), params: { guest: { plus_ones_count: 0 } }
    assert_redirected_to admin_guests_url
    assert_equal 0, @guest.reload.plus_ones_count
  end

  test "should update guest with companion" do
    companion = guests(:jane_doe)
    patch admin_guest_url(@guest), params: { guest: { companion_id: companion.id } }
    assert_redirected_to admin_guests_url
    assert_equal companion.id, @guest.reload.companion_id
  end

  test "should destroy guest" do
    assert_difference("Guest.count", -1) do
      delete admin_guest_url(@guest)
    end

    assert_redirected_to admin_guests_url
  end
end
