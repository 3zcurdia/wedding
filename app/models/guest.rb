# frozen_string_literal: true

require "csv"

class Guest < ApplicationRecord
  has_many :companion_guests, class_name: "Guest", foreign_key: :companion_id
  belongs_to :companion, class_name: "Guest", optional: true

  scope :confirmed, -> { where.not(confirmed_at: nil) }

  validates :first_name, :last_name, :phone, presence: true
  validates :phone, uniqueness: true
  normalizes :phone, with: ->(value) { value.gsub(/\D/, "").strip }

  class << self
    def import_csv(file)
      import_csv!(file)
      true
    rescue StandardError
      false
    end

    def import_csv!(file)
      Guest.transaction do
        CSV.foreach(file.path, headers: true) do |row|
          data = row.to_h.symbolize_keys
          next if data[:phone].blank?

          Guest.find_or_create_by!(phone: data[:phone]) do |guest|
            guest.first_name = data[:first_name]
            guest.last_name = data[:last_name]
            guest.plus_ones_count = data[:plus_ones] || data[:plus_ones_count]
          end
        end
      end
    end

    def with_phone(phone)
      find_by(phone: phone.gsub(/\D/, ""))
    end
  end

  def available_plus_ones
    return 0 unless main?

    companion_guests.count.to_i + plus_ones_count
  end

  def main?
    companion_id.blank?
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def viewed!
    update!(last_viewed_at: Time.zone.now)
  end

  def confirm!
    update!(confirmed_at: Time.zone.now)
  end

  def confirmed?
    confirmed_at.present?
  end
end
