class Pcr < ActiveRecord::Base
	belongs_to :dnasample
  	has_and_belongs_to_many :projects
	has_many :tubes
	
	accepts_nested_attributes_for :tubes, :allow_destroy=>true

	def self.project(term)
		pcrs=Pcr.arel_table
		@project=Project.find(term)
		pcrs = @project.pcrs
		return pcrs
	end
end
