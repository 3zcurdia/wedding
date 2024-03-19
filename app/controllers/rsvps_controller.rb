class RsvpsController < ApplicationController
  layout "pages"
  before_action :validate_guest!

  def show
  end

  def new
  end

  def create
  end

  private

  def rsvp_params
    params.require(:rsvp).permit(:attending, :plus_ones)
  end
end
