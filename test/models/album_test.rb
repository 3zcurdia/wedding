# frozen_string_literal: true

require "test_helper"

class AlbumTest < ActiveSupport::TestCase
  test "valid fixture" do
    assert_predicate albums(:one), :valid?
  end
end
