class Primer < ActiveRecord::Base
    has_and_belongs_to_many :genes
    
        def self.search(search)
           if search
              @search=Primer.primerl_or_primerh_or_id_like_any(search)  #Search is not built yet
              else
                @search=Primer.primerl_like("")
          end
      end
end
