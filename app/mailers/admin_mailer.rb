# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  def password_reset
    @admin = params[:admin]
    @signed_id = @admin.generate_token_for(:password_reset)

    mail to: @admin.email, subject: "Reset your password"
  end

  def email_verification
    @admin = params[:admin]
    @signed_id = @admin.generate_token_for(:email_verification)

    mail to: @admin.email, subject: "Verify your email"
  end
end
