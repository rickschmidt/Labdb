Feature: Manage PCRS for an exmperiment
    
    In order to study a dna sample
	As a user I want to add a dnasample to a PCR reaction along with its reagents
	I want to be able to select forward and reverse primers for the pcr reaction
	I want to be able to select a protocol from a list of protocols
	I want to be able to see which project my pcr reaction is part of
	
	
	
    
    
    Scenario: create a pcr reaction
        Given a dna sample from the dna samples model
        When I create a new pcr reactoin 
		Then I should be able to autocomplete the project name
		Then I should be able to create a mixture and add primers
		
	
		
		