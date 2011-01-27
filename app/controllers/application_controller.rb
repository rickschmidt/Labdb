# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def primer length
    @dna=['C','A', 'T','G']
    @primer=""
    for n in 1..10
    i=rand(4)

      @primer<<@dna[i].to_str
      
  end
end
end
