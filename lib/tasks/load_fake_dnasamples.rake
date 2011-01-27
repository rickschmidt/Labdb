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
:elution_volumne=>rand(10.0),
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

=begin
  TODO Load in the rest of pcr and then tax, populate test db and update indexes
=end
)


pcr.save false 

end
end 
end


