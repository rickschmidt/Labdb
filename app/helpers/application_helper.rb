# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  

   def sortable(column, title = nil)
          title ||= column.titleize
          css_class = "custom" #column == sort_column ? "current #{sort_direction}" : nil
          direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
          link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
        end
end
