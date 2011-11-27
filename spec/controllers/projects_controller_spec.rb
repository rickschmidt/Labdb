require 'spec_helper'

describe ProjectsController do 
	
	#CREATE
	describe "POST /projects" do
		before(:each) do
			@project=stub_model(Project,:save=>true)
			Project.stub(:find).with("1").and_return(@project)
		end
			
		it "should create a new project with a name" do
			project = mock_model("Project",:save=>true)
			Project.stub(:create).with("1"){ project}
	    	post :create, :project => {:project_name=>"rspec"}
	    	response.should redirect_to(project_url("1"))						
		end

	end
	
	# UPDATE
	describe "PUT /projects/:id" do
		before(:each) do
			@project=stub_model(Project,:save=>true)
			Project.stub(:find).with("1").and_return(@project)
	    end
	      
	    it "should find project and return object" do
			get :show, :project
      	end
      
      	it "should update the project object's attributes" do
        	@project.should_receive(:update_attributes).and_return(true)
      	end
      
      	it "should redirect to the projects show page" do
        	response.should redirect_to(project_url(@project))
      	end
		
	end
	
	
end