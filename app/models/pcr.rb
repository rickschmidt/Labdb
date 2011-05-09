class Pcr < ActiveRecord::Base
  has_and_belongs_to_many :experiments
  has_and_belongs_to_many :dnasamples
  
   def self.search(search)
        if search
          
          Pcr.primerh_like_any(search)
        else
          @search=Pcr.id_like("")

          
        end
      end
  
  
end
