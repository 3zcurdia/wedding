# frozen_string_literal: true

class PlusOne < ApplicationRecord
  belongs_to :guest, inverse_of: :plus_ones, counter_cache: true
end
