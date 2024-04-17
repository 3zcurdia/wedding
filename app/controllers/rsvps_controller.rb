# frozen_string_literal: true

class RsvpsController < ApplicationController
  layout "pages"
  before_action :validate_guest!
  before_action :set_guest

  def show; end

  def new; end

  def create
    if @guest.update(rsvp_params) && @guest.confirm!
      redirect_to rsvp_url, notice: "RSVP was successfully updated."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_guest
    @guest = current_guest
  end

  def rsvp_params
    params.require(:guest).permit(:phone, :confirmed_plus_ones)
  end
end
