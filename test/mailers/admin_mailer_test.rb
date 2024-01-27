# frozen_string_literal: true

require "test_helper"

class AdminMailerTest < ActionMailer::TestCase
  setup do
    @admin = admins(:lazaro_nixon)
  end

  test "password_reset" do
    mail = AdminMailer.with(admin: @admin).password_reset

    assert_equal "Reset your password", mail.subject
    assert_equal [@admin.email], mail.to
  end

  test "email_verification" do
    mail = AdminMailer.with(admin: @admin).email_verification

    assert_equal "Verify your email", mail.subject
    assert_equal [@admin.email], mail.to
  end
end
