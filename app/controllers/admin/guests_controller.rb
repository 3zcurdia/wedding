# frozen_string_literal: true

module Admin
  class GuestsController < ApplicationController
    before_action :set_guest, only: %i[show edit update destroy]

    def index
      @guests_count = Guest.count
      @plus_ones_count = Guest.sum(:plus_ones_count)
      @confirmed_count = Guest.total_confirmed
      query = build_query
      @pagy, @guests = pagy(query, page: params[:page])
    end

    def show; end

    def new
      @guest = Guest.new
    end

    def edit; end

    def create
      @guest = Guest.new(guest_params)

      respond_to do |format|
        if @guest.save
          format.html { redirect_to admin_guests_url, notice: "Guest was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @guest.update(guest_params)
          format.html { redirect_to admin_guests_url, notice: "Guest was successfully updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @guest.destroy!

      respond_to do |format|
        format.html { redirect_to admin_guests_url, notice: "Guest was successfully destroyed." }
      end
    end

    private

    def build_query
      build_search_query.then { |query| sort_query(query) }
    end

    def build_search_query
      if params[:search].present?
        Guest.search(params[:search])
      else
        Guest.includes(:companion_guests).all
      end
    end

    def sort_query(query)
      return query if params[:sort_column].blank? || params[:sort_direction].blank?

      if Guest.column_names.include?(params[:sort_column])
        query.order("#{params[:sort_column]} #{params[:sort_direction]}")
      else
        query
      end
    end

    def set_guest
      @guest = Guest.find(params[:id])
    end

    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :phone, :plus_ones_count, :companion_id)
    end
  end
end
