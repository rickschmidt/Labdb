class Pcr < ActiveRecord::Base
  belongs_to :experiment
  has_and_belongs_to_many :dnasamples
  
  
end
