# frozen_string_literal: true

require "test_helper"

class AdminUserTest < ActiveSupport::TestCase
  def admin
    @admin ||= admin_users(:lazaro_nixon)
  end

  def test_valid
    assert admin.valid?
  end

  def test_invalid_without_email
    admin.email = nil

    refute admin.valid?
    assert_equal ["no puede estar en blanco", "no es válido"], admin.errors[:email]
  end
end
