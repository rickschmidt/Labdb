require 'spec_helper'

describe DnasamplesController do 
	
	#CREATE
	describe "POST /dnasamples" do
		render_views

		
		# it "should create a new message" do
		# 	# dnasample=Dnasample.new
		# 
		# 	Dnasample.should_receive(:create)
		# 	  post 'create' , :dnasample => {"project_name" => "rspec" }
		# 	response.should be_success
		# end
		it "should have all the fields" do
			visit new_dnasample_path
			fill_in "dnasample_dna_accession", :with=>"Rspec capybara"
			save_and_open_page
			click_button "Create"
			# click_button "Create"

		end
	end
	
	
	it "should be able to have multiple projects" 
	
end

