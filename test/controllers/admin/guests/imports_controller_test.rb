# frozen_string_literal: true

require "test_helper"

class Admin::Guests::ImportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    admin_sign_in
  end

  test "should get new" do
    get new_admin_guests_import_path
    assert_response :success
  end

  test "must uplodad guests via csv successfuly" do
    file = fixture_file_upload("guests.csv", "text/csv")
    post admin_guests_imports_path, params: { guests: { file: } }
    assert_redirected_to admin_guests_path
  end
end
