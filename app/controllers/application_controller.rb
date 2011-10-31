class ApplicationController < ActionController::Base
  protect_from_forgery

	protected
	
	def layout_by_resource
    	if devise_controller?

	    else
	      "application"
	    end
  	end
end
