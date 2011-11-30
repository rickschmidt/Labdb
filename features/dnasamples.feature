Feature: add dna samples to the dnasamples table
    
    In order to add the dna samples 
    As a user
    I want to be able to create new dna samples
    
        Scenario: Create a new dna samples
        Given a dna sample 
        When I post the dnasample to dnasamples/new

        
