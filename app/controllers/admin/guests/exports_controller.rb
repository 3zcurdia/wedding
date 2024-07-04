# frozen_string_literal: true

module Admin
  module Guests
    class ExportsController < ApplicationController
      def show
        csv = Guest.export_csv(Guest.main.order_by_priority)
        send_data csv, type: "text/csv", disposition: "attachment", filename: "guests-#{Time.now.to_i}.csv"
      end
    end
  end
end
