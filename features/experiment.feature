Feature: add dna samples into the experiment directly
    
    In order to add the dna samples directly
    As a user
    I want to be able to add the primers used once per experiment
    And do not give pcr tubes numbers instead use the experiment to define the numbers.
    A sample may be run with the same primers for different experimetns and perhaps in different order each time
    
    
    Scenario: order a dna sample directly to the experimetns show
        Given a dna sample from the dna samples model
        When I update the select box by adding a dna sample to experiment show view
        Then update the dna sample used in the view
        
    Scenario: save an experiment
        Given an experiment with dna samples selected
        When I save the experiment
        Then save the dna samples used in the experiment
        
        
        =begin
            TODO Create a migration to link the experiments and dna samples tables
        =end