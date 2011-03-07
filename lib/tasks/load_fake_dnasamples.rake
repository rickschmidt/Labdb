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
100.times do

dnasample = Dnasample.create(

:dna_accession=>rand(100),
:dnasample_number=>rand(100),
:date=>Date.today+rand(1000),
:method=>"Extraction",
:elution_volume=>rand(10.0),
:second_elute=>Faker::Lorem::words,
:second_elute_volumne=>rand(10.0),
:reextracted=>Faker::Lorem::words,
:created_by=>Faker::Lorem::name

)


dnasample.save false 

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
100.times do

taxonomy = Taxonomy.create(


:genus=>Faker::Lorem::name,
:species=>Faker::Lorem::name,
:subspecies=>Faker::Lorem::name,
:new_diagnosis=>Faker::Lorem::name,
:family=>Faker::Lorem::name,
:description_pdf=>Faker::Lorem::name,
:synonyms=>Faker::Lorem::name,
:type_museum=>Faker::Lorem::name,
:distribution=>Faker::Lorem::name,
:ingroup=>Faker::Lorem::name,
:other_literature=>Faker::Lorem::name,
:character_diagnosis=>Faker::Lorem::name,
:description=>Faker::Lorem::name,
:countries=>Faker::Lorem::name

)


taxonomy.save false 

end
end 
end



