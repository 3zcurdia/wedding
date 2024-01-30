# frozen_string_literal: true

require "test_helper"

class AdminTest < ActiveSupport::TestCase
  def admin
    @admin ||= admins(:lazaro_nixon)
  end

  def test_valid
    assert admin.valid?
  end

  def test_invalid_without_email
    admin.email = nil

    refute admin.valid?
    assert_equal ["can't be blank", "is invalid"], admin.errors[:email]
  end
end
