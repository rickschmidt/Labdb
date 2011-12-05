Feature: Manage a project
	In order to perform an experiment 
	A user will need to complete at minimum in order
	Create a project
	Create a Taxonomy for the Dnasample being studied
	Create a Dnasample and link it to a project and a taxonomy
	Create or have a set of primers stored
	Create a PCR reaction and add link it to a forward and reverse primer
	Link the pcr with a dnasample
	Add many pcrs to the project
	
	
	Scenario: User created a new project
		Given a new project empty project
		Then  a user created the necessary components in the database
		Then a user can add a pcr reaction to a project
		
	Scenario: User has a project
		Given a project a user can choose from a list of pcrs 
		Then the pcrs are available in scrollbox on the right using jquery ui selectable.  
		Then selected elements are automatically saved as pcrs
		Then on a pcr page a user could autocomplete a project box as another way to associate projects and pcrs.
		
	Scenario: Project results come in
		Given an experiment has run a user can attach a gel photo
		Then a user can select which elements worked and which ones did not
		Then a list can be compiled to prepare for sequencing
	