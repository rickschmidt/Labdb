# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  

   def sortable(column, title = nil)
          title ||= column.titleize
          css_class = "custom" #column == sort_column ? "current #{sort_direction}" : nil
          direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
          link_to title, params.merge(:sort => column, :direction => direction, :page => nil), {:class => css_class}
        end
        

def success(pcr)
    if pcr.success?
        check_box("pcr","pcr_success", {:checked=>true})
    else
        check_box("pcr","pcr_success", {:checked=>false})
    end    
end

def ready(pcr)
    if pcr.ready?
        check_box("pcr","pcr_ready",{:checked=>true})
    else
        check_box("pcr","pcr_ready",{:checked=>false})
    end        
end

    #         
    #           <%if pcr.success==true%>
    #   <td align="center"><%= check_box("pcr","pcr_success",{:checked=>true}) %></td>
    # <%else%>
    #   <td align="center"><%= check_box("pcr","pcr_success",{:checked=>false}) %></td>
    # <%end%>
    # 
    # <%if pcr.ready?%>
    #   <td align="center"><%= check_box("pcr","pcr_ready",{:checked=>true}) %></td>
    # <%else%>
    #   <td align="center"><%= check_box("pcr","pcr_ready",{:checked=>false}) %></td>
    # <%end%>
end
