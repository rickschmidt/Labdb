class Dnasample < ActiveRecord::Base
  	has_and_belongs_to_many :genes
  	has_and_belongs_to_many :pcrs
  	belongs_to :taxonomy
  	has_and_belongs_to_many :projects#, :through=>:pcrs
	accepts_nested_attributes_for :taxonomy, :allow_destroy=>true
	accepts_nested_attributes_for :projects, :allow_destroy=>true
	validates :projects, :presence=>true
	validates :dnasample_number, :presence=>true
	validates :location_collected, :presence=>true
	validates :method, :presence=>true
	validates :taxonomy, :presence=>true
end
