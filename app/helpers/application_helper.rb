# frozen_string_literal: true

module ApplicationHelper
  include Pagy::Frontend

  def flash_class(type)
    case type
    when "success"
      "bg-green-500 text-white"
    when "error"
      "bg-red-500 text-white"
    when "warning"
      "bg-yellow-500 text-black"
    when "notice"
      "bg-blue-500 text-white"
    else
      "bg-gray-500 text-white"
    end
  end
end
