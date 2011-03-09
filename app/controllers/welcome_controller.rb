class WelcomeController < ApplicationController
  before_filter :require_user
   helper_method :primer
  layout 'general'
  def index
    @experiments=Experiment.find(:all, :order => 'updated_at DESC', :limit=>5)
    
    primer 10
    @primer
    
    
  end
end
