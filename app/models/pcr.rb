class Pcr < ActiveRecord::Base
  has_and_belongs_to_many :experiments
  has_and_belongs_to_many :dnasamples
  
end
