# frozen_string_literal: true

require "test_helper"

class AdminMailerTest < ActionMailer::TestCase
  setup do
    @admin = admin_users(:lazaro_nixon)
  end

  test "password_reset" do
    skip
    mail = AdminMailer.with(admin: @admin).password_reset

    assert_equal "Reset your password", mail.subject
    assert_equal [@admin.email], mail.to
  end
end
