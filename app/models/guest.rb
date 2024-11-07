# frozen_string_literal: true

require "csv"

class Guest < ApplicationRecord
  has_many :companion_guests, class_name: "Guest", foreign_key: :companion_id
  belongs_to :companion, class_name: "Guest", optional: true

  scope :invitable, -> { where(canceled_at: nil) }
  scope :main, -> { invitable.where(companion_id: nil) }
  scope :confirmed, -> { invitable.where.not(confirmed_at: nil) }
  scope :canceled, -> { where.not(canceled_at: nil) }
  scope :order_by_priority, -> { order(confirmed_plus_ones: :desc, confirmed_at: :desc, last_viewed_at: :desc) }

  validates :first_name, :last_name, presence: true
  validates :phone, presence: true, uniqueness: true, if: :main?
  normalizes :phone, with: ->(value) { value.gsub(/\D/, "").strip }

  class << self
    def export_csv(guests)
      CSV.generate do |csv|
        csv << %w[last_name first_name phone available_plus_ones confirmed_plus_ones]
        guests.each do |guest|
          csv << [guest.last_name, guest.first_name, guest.phone, guest.available_plus_ones, guest.confirmed_plus_ones]
        end
      end
    end

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

    def total_confirmed
      confirmed.main.count.to_i + confirmed.sum(:confirmed_plus_ones).to_i
    end
  end

  def available_plus_ones
    return 0 unless main?

    companion_guests.size.to_i + plus_ones_count.to_i
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
    companion_guests.each(&:confirm!) if main?
  end

  def confirmed?
    confirmed_at.present?
  end

  def cancel!
    update!(canceled_at: Time.zone.now, confirmed_at: nil, plus_ones_count: 0, confirmed_plus_ones: 0)
    companion_guests.map(&:cancel!)
  end

  def canceled?
    canceled_at.present?
  end
end
