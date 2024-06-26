# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  def password_reset
    @admin = params[:admin]
    @signed_id = @admin.generate_token_for(:password_reset)

    mail to: @admin.email, subject: "Reset your password"
  end
end
