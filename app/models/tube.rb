class Tube < ActiveRecord::Base
  	belongs_to :primer
	belongs_to :pcr
	
	
	#Used in auto complete when Tube needs to be selected. Searches the if field of Tube
	def self.pcr(term)
		tubes=Tube.arel_table
		tubes = Tube.where(tubes[:pcr_id].matches("#{term}"))
		return tubes
	end

  

end
