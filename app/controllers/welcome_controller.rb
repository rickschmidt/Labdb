class WelcomeController < ApplicationController
  before_filter :require_user
   helper_method :primer
  layout 'general'
  def index
    @experiments=Experiment.all(:order => 'id DESC', :limit=>5)
    
    primer 10
    @primer
    
    
  end
end
