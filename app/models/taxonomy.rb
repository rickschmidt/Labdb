class Taxonomy < ActiveRecord::Base
  has_and_belongs_to_many :dnasamples
  
    def self.search(search)
          @search=Taxonomy.genus_like("")  #Search is not built yet
      end
end
