# frozen_string_literal: true

class PagesController < ApplicationController
  layout "pages"
  # while editing the details markup, uncomment the line below for quick access
  before_action :validate_guest!, except: :home

  def home; end

  def details; end

  def calendar
    calendar = File.read(Rails.root.join("public", "calendar.ics"))
    respond_to do |format|
      format.html { send_data calendar, type: "text/calendar", disposition: "inline" }
    end
  end
end
