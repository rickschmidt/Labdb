class Pcr < ActiveRecord::Base
	belongs_to :dnasample
  	has_and_belongs_to_many :projects
	has_and_belongs_to_many :primers
	
	# accepts_nested_attributes_for :dnasample, :allow_destroy=>true
end
