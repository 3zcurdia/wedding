# frozen_string_literal: true

require "test_helper"

class GuestTest < ActiveSupport::TestCase
  def guest
    @guest ||= guests(:joe_doe)
  end

  def test_valid
    assert guest.valid?
  end

  def test_default_plus_ones_count
    assert_equal 0, Guest.new.plus_ones_count
  end

  def test_invalid_without_first_name
    guest.first_name = nil

    refute guest.valid?
    assert_equal ["can't be blank"], guest.errors[:first_name]
  end

  def test_invalid_without_last_name
    guest.last_name = nil

    refute guest.valid?
    assert_equal ["can't be blank"], guest.errors[:last_name]
  end

  def test_invalid_phones
    guest.phone = "ABCDEFGHIJKL"

    refute guest.valid?
    assert_equal ["can't be blank"], guest.errors[:phone]
  end

  def test_full_name
    assert_equal "Joe Doe", guest.full_name
  end

  def test_confirm
    guest.confirmed_at = nil
    guest.confirm!

    assert guest.confirmed?
  end
end
