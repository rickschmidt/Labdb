class Gene < ActiveRecord::Base
  # has_and_belongs_to_many :dnasamples
	has_many :dnasamples
	
	#Used in auto complete when Gene needs to be selected. Searches the genbank field of Gene
	def self.search(term)
		genes=Gene.arel_table
		genes = Gene.where(genes[:genbank].matches("%#{term}%"))
		return genes
	end

end
