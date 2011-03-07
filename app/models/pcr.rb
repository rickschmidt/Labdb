class Pcr < ActiveRecord::Base
  belongs_to :experiment
  belongs_to :dnasample
  
  
end
