Given /^a the fields necessary for a dna sample$/ do
	 @dnasample=FactoryGirl.build(:dnasample)
end

Then /^I should be able to create a dna sample$/ do
	 @dnasample=FactoryGirl.create(:dnasample)	
end



Then /^I should be able to edit a dna sample$/ do
		sample=FactoryGirl.attributes_for(:dnasample)
		@dnasample.update_attributes(sample)
end


Then /^I should be able to delete a dna sample$/ do
	@dnasample.delete
end

