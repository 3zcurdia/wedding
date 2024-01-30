# frozen_string_literal: true

class Guest < ApplicationRecord
  validates :first_name, :last_name, :phone, presence: true
  validates :phone, uniqueness: true
  normalizes :phone, with: ->(value) { value.gsub(/\D/, "") }

  def full_name
    "#{first_name} #{last_name}"
  end

  def confirm!
    update!(confirmed_at: Time.zone.now)
  end

  def confirmed?
    confirmed_at.present?
  end

end
