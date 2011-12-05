require 'spec_helper'


describe DnasamplesController do 
	
	#CREATE
	describe "POST /dnasamples" do
		# render_views
		before(:each) do
			# @dnasample=mock_model(Dnasample)
			@dnasample=FactoryGirl.create(:dnasample)
			# Dnasample.stub!(:find).and_return(@dnasample)
			@build=FactoryGirl.build(:dnasample)
			@attrs=FactoryGirl.attributes_for(:dnasample)
			@emptydnasample=FactoryGirl.build(:emptydnasample)			
		end
		
		
		it "should be able to create a new dna sample to be posted" do
			Dnasample.should_receive(:new).and_return(@attrs)
			Dnasample.new			
		end
		
		it "should be able to post to the create method" do
 			Dnasample.should_receive(:create)
			Dnasample.should_receive(:save)
			puts "build #{@build}"
			puts "create #{@dnasample}"
			

			
			puts "@dan in create #{dna}"
			dna.should eql(@dnasample)
			
				
			
		end
		
		it "should then have a proper nested taxonomy object" do

			@dna.taxonomy.should_not eql(nil)
			@dna.taxonomy.should be_a_kind_of(Taxonomy)	
		end
		
		it "should have at least one project" do
			@dna.projects.should_not eql(nil)
			@dna.projects.should be_a_kind_of(Array)
			@dna.should have_at_least(1).projects
			
		end
		
		it "should fail posting a dnasample if there is no taxonomy or project" do
			@emptydnasample.should_not be_valid
 			dna=Dnasample.should_receive(:create).with(@emptydnasample)
			dna.should_not_receive(:save)
			dna=Dnasample.create(@emptydnasample)
			dna.should_not eql(@dnasample)
			
		end
	end
	
	
	it "should be able to have multiple projects" 
	
	describe "PUT /dnasamples" do
		before(:each) do
			# @dnasample=mock_model(Dnasample)
			@dnasample=FactoryGirl.create(:dnasample)
			# Dnasample.stub!(:find).and_return(@dnasample)
			@build=FactoryGirl.build(:dnasample)
			@attrs=FactoryGirl.attributes_for(:dnasample)
			@emptydnasample=FactoryGirl.build(:emptydnasample)			
			@updated_dnasample_attrs=FactoryGirl.attributes_for(:updated_dnasample)
			@updated_dnasample=FactoryGirl.create(:updated_dnasample)
		end
		
		
		it "should be able to update a dnasample" do
			@dnasample.update_attributes(@updated_dnasample_attrs)
			puts @updated_dnasample_attrs.inspect
			updated=Dnasample.find(@dnasample.id+1)
			updated.should eql(@updated_dnasample)

		end
	end
end

