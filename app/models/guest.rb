# frozen_string_literal: true

class Guest < ApplicationRecord
  has_many :plus_ones, dependent: :destroy, inverse_of: :guest
  validates :first_name, :last_name, :phone, presence: true
  validates :phone, uniqueness: true
  normalizes :phone, with: ->(value) { value.gsub(/\D/, "") }
  accepts_nested_attributes_for :plus_ones, reject_if: :all_blank, allow_destroy: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def set_confirmed_at
    self.confirmed_at = Time.zone.now if confirmed_at.nil?
  end

  def confirmed?
    confirmed_at.present?
  end

  def confirmed!
    update!(confirmed_at: Time.zone.now)
  end
end
