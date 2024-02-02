# frozen_string_literal: true

class PagesController < ApplicationController
  layout "pages"
  # while editing the details markup, uncomment the line below for quick access
  before_action :validate_guest!, only: :details

  def home; end

  def details; end
end
