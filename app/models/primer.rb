class Primer < ActiveRecord::Base
	belongs_to :tube
      validates_presence_of :name
       
#Used in auto complete when Primer needs to be selected. Searches the 
	def self.search(term)

		primers=Primer.arel_table
		primers =Primer.where(primers[:name].matches("%#{term}%"))
		return primers
	end

end
