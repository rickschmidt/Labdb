class Taxonomy < ActiveRecord::Base
  has_many :dnasamples
end
