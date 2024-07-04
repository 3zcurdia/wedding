# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  scope :random, -> { order(Arel.sql("RANDOM()")) }
end
