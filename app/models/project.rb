class Project < ActiveRecord::Base
  has_and_belongs_to_many :pcrs
  has_and_belongs_to_many :dnasamples#, :through=>:pcrs
  
  validates_presence_of :project_name
  validates_uniqueness_of :project_name
  		accepts_nested_attributes_for :dnasamples, :allow_destroy=>true
  
  
  

  def self.search(term)
       projects=Project.arel_table
		projects = Project.where(projects[:project_name].matches("%#{term}%"))
		return projects
      end
end
