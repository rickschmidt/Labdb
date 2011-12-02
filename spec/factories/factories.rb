FactoryGirl.define do
	factory :dnasample do
		dna_accession 'FG123'
		dnasample_number 'FG123Field'
		location_collected 'Rogers Park Chicago IL'
		method 'Quagen DNeasy Blood & Tissue Kit'
		
	end
	
	factory :taxonomy do
		genus 'Gallus'
		species 'gallus'
	end
end