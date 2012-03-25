class Tube < ActiveRecord::Base
  	belongs_to :primer
	belongs_to :pcr
	
	
	#Used in auto complete when Tube needs to be selected. Searches the if field of Tube
	def self.pcr(term)
		tubes=Tube.arel_table
		tubes = Tube.where(tubes[:pcr_id].matches("#{term}"))
		return tubes
	end
	
	def self.sectionize
		tubes={}
		tubes_pcrs=Tube.select(:pcr_id).group(:pcr_id)
		
		tubes_pcrs.each  do |t|
			if t.pcr_id!=nil
				tubes[t.pcr_id]=Tube.where("pcr_id=?",t.pcr_id)
			else
				tubes["Not Set"]=Tube.where("pcr_id IS NULL")
			end
		end
		return tubes
	end	
end
