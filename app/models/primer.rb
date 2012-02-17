class Primer < ActiveRecord::Base
	belongs_to :tube
      validates_presence_of :name
       

end
