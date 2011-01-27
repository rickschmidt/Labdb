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
desc "create some fake primers" 

task :create_primers => :environment do 
1000.times do

experiment = Experiment.create(

:primerl=>(primer 10),
:primerh=>(primer 10),
:date=>Date.today+rand(1000),
:anneal=>rand(10.0)+90,
:dna_amount=>rand(15),
:total_samples=>rand(20),
:notes=>Faker::Lorem::sentences,
:experiment_number=>rand(50),
:bsa=>rand(15),
:buffer=>rand(15),
:mgcl2=>rand(15),
:taq=>rand(15),
:h2o=>rand(15),
:dntps=>rand(15),
:dna=>rand(15),
:primerl_amount=>rand(15),
:primerh_amount=>rand(15),
:total=>rand(15)
)


experiment.save false 

end
end 
end
