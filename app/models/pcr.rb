class Pcr < ActiveRecord::Base
	belongs_to :dnasample
  	has_and_belongs_to_many :projects ,:uniq => true
	has_many :tubes
	
	accepts_nested_attributes_for :tubes, :allow_destroy=>true

	def self.search(term)
		pcrs=Pcr.arel_table
		pcrs =Pcr.where(pcrs[:pcr_tube_number].matches("%#{term}%"))
		puts "pcrs #{pcrs.inspect}"
		return pcrs
	end
end
