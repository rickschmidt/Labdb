Feature: The database should manage DNA Samples
    
    In order to manage the dna samples
    As a user
    I want to be able to create new dna samples
	View an individual dna samples
	Edit a dnasample
	Delete a dnasample
    
        Scenario: Create a new dna sample
        	Given a the fields necessary for a dna sample 
			Then I should be able to create a dna sample
			Then I should be able to edit a dna sample
			Then I should be able to delete a dna sample
			