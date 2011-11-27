require 'spec_helper'

describe DnasamplesController do 
	
	#CREATE
	describe "POST /dnasamples" do
		before(:each) do
			@dnasample=mock_model(Dnasample)
			Dnasample.stub!(:find).with("1").and_return(@dnasample)
		end
		
		# it "should create a new message" do
		# 	# dnasample=Dnasample.new
		# 
		# 	Dnasample.should_receive(:create)
		# 	  post 'create' , :dnasample => {"project_name" => "rspec" }
		# 	response.should be_success
		# end
	end
	
end

