# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  parallelize(workers: :number_of_processors)
  fixtures :all

  def admin_session
    @admin_session ||= admin_users(:lazaro_nixon).sessions.create!
  end

  def admin_sign_in
    # post(admin_sign_in_url, params: { email: admin_users(:lazaro_nixon).email, password: "Secret1*3*5*" })
    cookies[:session_token] = admin_session.id
  end
end
