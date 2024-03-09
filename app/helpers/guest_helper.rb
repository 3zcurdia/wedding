# frozen_string_literal: true

module GuestHelper
  def total_plus_ones(guest)
    guest.plus_ones_count + guest.companion_guests.count
  end

  def companion_names(guest)
    return if guest.companion_guests.empty?

    companions = guest.companion_guests.pluck(:first_name).map(&:capitalize).to_sentence
    "Dentro de tus acompañantes estamos considerando a #{companions}"
  end
end
