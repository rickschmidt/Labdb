require 'spec_helper'

	#CREATE	
	describe "POST /dnasamples" do
		# render_views
		before(:each) do
			@dnasample=mock_model(Dnasample)
			Dnasample.stub!(:find).and_return(@dnasample)
			@dnasample.stub!(:location_collected).and_return('NY NY')
		end
		
		it "should be able to follow a link to the new page" do
			visit dnasamples_path
			click_button "Create"
		end
		
		it "should then be able to fill in the new form" do
			visit new_dnasample_path
			fill_in "dnasample_dna_accession", :with=>"Rspec capybara"
			fill_in "taxonomy_select", :with=>"1"
			fill_in "dnasample_collector_number", :with=>"1"
			fill_in "dnasample_location_collected", :with=>"Chicago, IL"
			fill_in "dnasample_museum", :with=>"Field"
			select 'Tissue',:from=>"dnasample_sample_type"
			select('Male',:from=>'dnasample_specimen_gender')
			fill_in "dnasample_dnasample_number", :with=>"AABB"
			# select(Date.today,:from=>"dnasample_date_li")
			select('Qiagen DNeasy Blood & Tissue Kit',:from=>'dnasample_method')
			fill_in "dnasample_first_elution_volume", :with=>"1"
			fill_in "dnasample_second_elution_volume", :with=>"2"
			fill_in "dnasample_extraction_notes", :with=>"Notes"
			click_button "Create"
			page.should have_content("Dnasample was successfully created.")

		end
		
		it "should be able to edit a dnasample on " do
			visit dnasample_path(@dnasample)
			save_and_open_page
		end
	end
	


