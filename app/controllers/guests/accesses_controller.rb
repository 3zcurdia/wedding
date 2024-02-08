# frozen_string_literal: true

module Guests
  class AccessesController < ApplicationController
    def create
      if (guest = Guest.with_phone(guest_params[:phone]))
        session[:guest_id] = guest.id
        redirect_to details_url
      else
        redirect_to root_url, alert: "Guest not found"
      end
    end

    private

    def guest_params
      params.require(:guest).permit(:phone)
    end
  end
end
