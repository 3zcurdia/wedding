# frozen_string_literal: true

module Admin
  module Guests
    class ImportsController < ApplicationController
      def new; end

      def create
        if Guest.import_csv(guest_params[:file])
          redirect_to admin_guests_path, notice: "Guests were successfully created"
        else
          redirect_to admin_guests_path, alert: "There was an error creating the guests"
        end
      end

      private

      def guest_params
        params.require(:guests).permit(:file)
      end
    end
  end
end
