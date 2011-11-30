Given /^a dna sample$/ do
	visit "/dnasamples/new"
	# click_button "Create"
	
	# @dnasample=Dnasample.new
end

When /^I post the dnasample to dnasamples\/new$/ do
	# @dnasample=Dnasample.new :dna_accession=>"Cucumber accession"
	# @dnasample.save
	fill_in :dnasample_dna_accession, :with=>"Capybara"
	page.should have_content :museum
	fill_in :taxonomies, :with=>"1"
	fill_in :collector_number, :with=>"1"
	fill_in :location_collected, :with=>"Chicago, IL"
	fill_in :museum, :with=>"Field"
	select 'Tissue',:from=>"dnasample_sample_type"
	select('Male',:from=>'dnasample_specimen_gender')
	fill_in :dnasample_number, :with=>"AABB"
	fill_in :date, :with=>Date.today
	select('Qiagen DNeasy Blood & Tissue Kit',:from=>'dnasample_method')
	fill_in :first_elution_volume, :with=>"1"
	fill_in :second_elution_volume, :with=>"2"
	fill_in :extraction_notes, :with=>"Notes"
	click_button "Create"
end

