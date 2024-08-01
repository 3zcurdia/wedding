# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def after_event?
    Date.current.after?(Date.new(2024, 7, 27))
  end

  def ld(date, **)
    return if date.blank?

    l(date, **)
  end

  def flash_class(type)
    case type
    when "success"
      "flex bg-green-100 rounded-lg p-4 mb-4 text-sm text-green-700"
    when "error"
      "flex bg-red-100 rounded-lg p-4 mb-4 text-sm text-red-700"
    when "warning"
      "flex bg-yellow-100 rounded-lg p-4 mb-4 text-sm text-yellow-700"
    else
      "flex bg-blue-100 rounded-lg p-4 mb-4 text-sm text-blue-700"
    end
  end
end
