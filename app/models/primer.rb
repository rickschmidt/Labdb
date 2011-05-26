class Primer < ActiveRecord::Base
    has_and_belongs_to_many :genes
      validates_presence_of :name
        def self.search(search)
           if search
              @search=Primer.primerl_or_primerh_or_id_like_any(search)  #Search is not built yet
              else
          @search=Primer.id_like("")
          end
      end
end
