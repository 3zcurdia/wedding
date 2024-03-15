class RsvpController < ApplicationController
  before_action :validate_guest!, except: %i[home faq]

  def show
  end

  def new
  end

  def create
  end
end
