class Primer < ActiveRecord::Base
    has_and_belongs_to_many :genes
      validates_presence_of :name
       

end
