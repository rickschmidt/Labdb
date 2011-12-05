# run with rake db: task_name
def primer length
  @dna=['C','A', 'T','G']
  @primer=""
  for n in 1..10
  i=rand(4)

     @primer<<@dna[i].to_str
    
end
return @primer
end
namespace :db do 
desc "create some fake dnasamples" 

task :create_dnasamples => :environment do 
10.times do

dnasample = Dnasample.create(

:dna_accession=>rand(100),
:dnasample_number=>rand(100),
:date=>Date.today+rand(1000),
:method=>"Extraction",
:elution_volume=>rand(10.0),
:second_elute=>"yes",
:second_elute_volumne=>rand(10.0),
:reextracted=>"yes",
:created_by=>Faker::Lorem::name

)


dnasample.save 

end
end 
end

namespace :db do
	desc "Create fake projects"
	task :create_projects=>:environment do
		i=1
		30.times do
			project=Project.create(
			:project_name=>"Project #{i}",
			:date=>Date.today-rand(90),
			:anneal=>rand(100.0),
			:dna_amount=>rand(10.0),
			:total_samples=>rand(30),
			:bsa=>rand(10.0),
			:buffer=>rand(10.0),
			:mgcl2=>rand(10.0),
			:taq=>rand(10.0),
			:h2o=>rand(10.0),
			:dntps=>rand(10.0),
			:dna=>rand(10.0),
			:notes=>Faker::Lorem.paragraph(3)			
			)
			i=i+1
			project.save
		end
	end
end

namespace :db do 
desc "create some fake genes" 

task :create_genes => :environment do 
100.times do

gene = Gene.create(

:genbank=>rand(100),
:locus=>rand(100),
:primerh=>(primer 10),
:primerl=>(primer 10)
)


gene.save false 

end
end 
end

namespace :db do 
desc "create some fake pcrs" 

task :create_pcrs => :environment do 
100.times do

pcr = Pcr.create(


:pcr_tube_number=>rand(20),
:gel_image=>"image",
:anneal_temp=>rand(10)+90,
:dna_amount=>rand(50),
:conditions=>"normal",
:total_samples=>rand(50),
:notes=> "notes",
:reamp=> rand(10),
:total_worked=> rand(50),
:denature=>rand(10)+80,
:extension=>rand(10)+85,
:cycle=>rand(80),
:primerh=>(primer 10),
:primerl=>(primer 10)

)


pcr.save false 

end
end 
end

namespace :db do 
desc "create some fake taxonomies" 

task :create_taxonomies => :environment do 
	counter=1
100.times do

taxonomy = Taxonomy.create(


:genus=>"Genus #{counter}",
:species=>"species #{counter}",
:subspecies=>"subspecies #{counter}",
:new_diagnosis=>Faker::Lorem.words(1),
:family=>Faker::Lorem.words(1),
:description_pdf=>Faker::Lorem.words(1),
:synonyms=>Faker::Lorem.words(1),
:type_museum=>Faker::Lorem.words(1),
:distribution=>Faker::Lorem.words(1),
:ingroup=>Faker::Lorem.words(1),
:other_literature=>Faker::Lorem.words(1),
:character_diagnosis=>Faker::Lorem.words(1),
:description=>Faker::Lorem.words(1),
:countries=>Faker::Lorem.words(1)

)


taxonomy.save 
counter=counter+1

end
end 
end



