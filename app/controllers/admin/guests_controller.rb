# frozen_string_literal: true

module Admin
  class GuestsController < ApplicationController
    before_action :set_guest, only: %i[show edit update destroy]

    def index
      query = Guest.all
      @guests_count = query.count
      @plus_ones_count = query.sum(:plus_ones_count)
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
          format.html { redirect_to admin_guest_url(@guest), notice: "Guest was successfully created." }
        else
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @guest.update(guest_params)
          format.html { redirect_to admin_guest_url(@guest), notice: "Guest was successfully updated." }
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

    def set_guest
      @guest = Guest.find(params[:id])
    end

    def guest_params
      params.require(:guest).permit(:first_name, :last_name, :phone, :plus_ones_count, :companion_id)
    end
  end
end
