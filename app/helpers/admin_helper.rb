# frozen_string_literal: true

module AdminHelper
  def guest_sort_link(column)
    sort_link(column, :admin_guests_path)
  end

  def sort_link(column, path_func)
    direction = params[:sort_column] == column && params[:sort_direction] == "asc" ? "desc" : "asc"
    link_to public_send(path_func, sort_column: column, sort_direction: direction),
            class: "flex items-center gap-2 hover:cursor-pointer" do
      sortable_icon(direction) + content_tag(:span, column.titleize)
    end
  end

  def sortable_icon(direction)
    icon = direction == "asc" ? "sort-up" : "sort-down"
    content_tag(:i, "", class: "fas fa-#{icon}")
  end
end
