# frozen_string_literal: true

module Admins
  class PasswordsController < ApplicationController
    before_action :set_admin

    def edit; end

    def update
      if @admin.update(admin_params)
        redirect_to root_path, notice: "Your password has been changed"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_admin
      @admin = Current.admin
    end

    def admin_params
      params.permit(:password, :password_confirmation, :password_challenge).with_defaults(password_challenge: "")
    end
  end
end
