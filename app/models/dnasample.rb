class Dnasample < ActiveRecord::Base
  	# has_and_belongs_to_many :genes
  	# has_and_belongs_to_many :pcrs  #should be many to one - dnasample has many pcrs
	has_many :pcrs
	has_many :projects, :through=>:pcrs
  	belongs_to :taxonomy
	belongs_to :gene
	
  	# has_and_belongs_to_many :projects#, :through=>:pcrs
	accepts_nested_attributes_for :taxonomy, :allow_destroy=>true
	accepts_nested_attributes_for :gene, :allow_destroy=>true
	# validates :projects, :presence=>true
	validates :dnasample_number, :presence=>true
	validates :location_collected, :presence=>true
	validates :method, :presence=>true
	validates :taxonomy, :presence=>true
	
	#Used in auto complete when Dnasample needs to be selected. Searches the accession and sample numbers field of Dnasample
	def self.search(term)

		dnasamples=Dnasample.arel_table
		dnasamples = Dnasample.where(dnasamples[:dna_accession].matches("%#{term}%").or(dnasamples[:dnasample_number].matches("%#{term}%")))
    puts "dnasamples #{dnasamples.inspect}"
		return dnasamples
	end
end

