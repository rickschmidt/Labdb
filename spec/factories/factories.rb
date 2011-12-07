FactoryGirl.define do
	
	# factory :project do
	# 		project_name "Project Factory"
	# 	end
	
	factory :taxonomy do
		genus 'Gallus'
		species 'gallus'
	end
	
	factory :dnasample do
		dna_accession 'FG123'
		dnasample_number 'FG123Field'
		location_collected 'Rogers Park Chicago IL'
		method 'Quagen DNeasy Blood & Tissue Kit'

		date Date.today
		first_elution_volume "10"
		second_elution_volume "20"
		specimen_gender "Male"
		collector_number "123"
		museum "Field"
		sample_type "Tissue"
		taxonomy FactoryGirl.create(:taxonomy)
		
	end
	factory :updated_dnasample, :class=>Dnasample do
		dna_accession 'FG123'
		dnasample_number 'FG123Field'
		location_collected 'NY, NY'
		method 'Quagen DNeasy Blood & Tissue Kit'

		date Date.today
		first_elution_volume "10"
		second_elution_volume "20"
		specimen_gender "Male"
		collector_number "123"
		museum "Field"
		sample_type "Tissue"
		taxonomy FactoryGirl.create(:taxonomy)
		
	end
	factory :emptydnasample, :class=>Dnasample do
		dna_accession 'FG123'
		dnasample_number 'FG123Field'
		location_collected 'Rogers Park Chicago IL'
		method 'Quagen DNeasy Blood & Tissue Kit'
		date Date.today
		first_elution_volume "10"
		second_elution_volume "20"
		specimen_gender "Male"
		collector_number "123"
		museum "Field"
		sample_type "Tissue"		
	end
	
	
	

end