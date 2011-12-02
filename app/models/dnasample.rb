class Dnasample < ActiveRecord::Base
  has_and_belongs_to_many :genes
  has_and_belongs_to_many :pcrs
  has_and_belongs_to_many :taxonomies
  has_and_belongs_to_many :experiments#, :through=>:pcrs
	accepts_nested_attributes_for :taxonomies
	

	validates :dnasample_number, :presence=>true
	validates :location_collected, :presence=>true
	validates :method, :presence=>true
end
