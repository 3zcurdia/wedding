# frozen_string_literal: true

class PagesController < ApplicationController
  layout "pages"
  before_action :validate_guest!, except: %i[home faq]

  def home
    invalidate_guest!
  end

  def details; end

  def faq; end

  def calendar
    calendar = File.read(Rails.root.join("public", "calendar.ics"))
    respond_to do |format|
      format.html { send_data calendar, type: "text/calendar", disposition: "inline" }
    end
  end
end
