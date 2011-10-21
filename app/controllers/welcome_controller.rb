class WelcomeController < ApplicationController

   helper_method :primer
  layout 'general'
  def index
    @experiments=Experiment.find(:all, :order => 'updated_at DESC', :limit=>5)
    


    
    
  end
end
