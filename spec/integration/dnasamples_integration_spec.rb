require 'spec_helper'

	#CREATE	
	describe "POST /dnasamples" do
		# render_views
		before(:each) do
			# @dnasample=mock_model(Dnasample)
			# Dnasample.stub!(:find).and_return(@dnasample)
			@dnasample=FactoryGirl.create(:dnasample)
			@taxonomy=FactoryGirl.create(:taxonomy)
			@dnasample.taxonomy=@taxonomy
			# @dnasample.stub!(:projects).and_return([FactoryGirl.build(:project)])
			# @dnasample.stub!(:taxonomy).and_return(FactoryGirl.build(:taxonomy))
			# @dnasample.stub!(:date).and_return(Date.today)
			# @dnasample.stub!(:location_collected).and_return("Chicaog IL")
			# @dnasample.stub!(:dna_accession).and_return("12")
			
			@dnasample.taxonomy should be_true
			puts @dnasample.taxonomy.inspect
			
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
			puts @dnasample.taxonomy
			puts @dnasample.id
			puts @dnasample.dna_accession
			@dnasample.taxonomy=@taxonomy
			visit edit_dnasample_path(@dnasample)
			save_and_open_page
			puts @dnasample.inspect
			
			fill_in "dnasample_dna_accession", :with=>"Rspec capybara"
			fill_in "taxonomy_select", :with=>"1"
			fill_in "dnasample_collector_number", :with=>"1"
			fill_in "dnasample_location_collected", :with=>"Chicago, IL"
			fill_in "dnasample_museum", :with=>"Field"
			select 'Tissue',:from=>"dnasample_sample_type"
			select('Male',:from=>'dnasample_specimen_gender')
			fill_in "dnasample_dnasample_number", :with=>"AABB"
			select('Qiagen DNeasy Blood & Tissue Kit',:from=>'dnasample_method')
			fill_in "dnasample_first_elution_volume", :with=>"1"
			fill_in "dnasample_second_elution_volume", :with=>"2"
			fill_in "dnasample_extraction_notes", :with=>"Notes"
			click_button "Update"
			page.should have_content("Dnasample was successfully update.")
			
		end
	end
	


