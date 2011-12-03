class Dnasample < ActiveRecord::Base
  has_and_belongs_to_many :genes
  has_and_belongs_to_many :pcrs
  has_and_belongs_to_many :taxonomies
  has_and_belongs_to_many :projects#, :through=>:pcrs
	accepts_nested_attributes_for :taxonomies
		accepts_nested_attributes_for :projects, :allow_destroy=>true
	
	validates :projects, :presence=>true
	validates :dnasample_number, :presence=>true
	validates :location_collected, :presence=>true
	validates :method, :presence=>true
end
