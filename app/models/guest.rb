# frozen_string_literal: true

require "csv"

class Guest < ApplicationRecord
  validates :first_name, :last_name, :phone, presence: true
  validates :phone, uniqueness: true
  normalizes :phone, with: ->(value) { value.gsub(/\D/, "") }

  def self.import_csv(file)
    import_csv!(file)
    true
  rescue StandardError
    false
  end

  def self.import_csv!(file)
    Guest.transaction do
      CSV.foreach(file.path, headers: true) do |row|
        data = row.to_h.symbolize_keys
        Guest.find_or_create_by!(phone: data[:phone]) do |guest|
          guest.first_name = data[:first_name]
          guest.last_name = data[:last_name]
          guest.plus_ones_count = data[:plus_ones] || data[:plus_ones_count]
        end
      end
    end
  end

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
