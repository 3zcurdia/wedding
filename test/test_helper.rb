# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  parallelize(workers: :number_of_processors)
  fixtures :all

  def admin_user
    @admin_user ||= admin_users(:lazaro_nixon)
  end

  def admin_sign_in
    post(admin_sign_in_url, params: { email: admin_user.email, password: "Secret1*3*5*" })
  end
end
