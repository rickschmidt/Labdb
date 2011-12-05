class Taxonomy < ActiveRecord::Base
  has_many :dnasamples
	accepts_nested_attributes_for :dnasamples

  

	#Used in auto complete when Taxonomy needs to be selected. Searches the Genus species and subspecies fields of Taxonomy
	def self.search(term)
		taxonomies=Taxonomy.arel_table
		taxonomies = Taxonomy.where(taxonomies[:genus].matches("%#{term}%").or(taxonomies[:species].matches("%#{term}%")).or(taxonomies[:subspecies].matches("%#{term}%")))	
		return taxonomies
	end
end
