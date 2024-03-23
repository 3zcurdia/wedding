# frozen_string_literal: true

class RsvpsController < ApplicationController
  layout "pages"
  before_action :validate_guest!

  def show; end

  def new
    @guest = current_guest
  end

  def create; end

  private

  def rsvp_params
    params.require(:guest).permit(:attending, :plus_ones)
  end
end
