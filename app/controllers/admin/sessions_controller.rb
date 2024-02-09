# frozen_string_literal: true

module Admin
  class SessionsController < ApplicationController
    skip_before_action :authenticate!, only: %i[new create]

    def index
      @sessions = Current.session_record.sessions.order(created_at: :desc)
    end

    def new; end

    def show; end

    def create
      if (admin = AdminUser.authenticate_by(email: params[:email], password: params[:password]))
        @session = admin.sessions.create!
        cookies.signed.permanent[:session_token] = { value: @session.id, httponly: true }

        redirect_to admin_path, notice: "Signed in successfully"
      else
        redirect_to admin_sign_in_path(email_hint: params[:email]), alert: "That email or password is incorrect"
      end
    end

    def destroy
      @session = Current.session_record.sessions.find(params[:id])
      @session.destroy
      redirect_to(admin_sessions_path, notice: "That session has been logged out")
    end
  end
end
