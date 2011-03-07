class Dnasample < ActiveRecord::Base
 # has_and_belongs_to_many :genes
  has_and_belongs_to_many :pcrs
#  has_and_belongs_to_many :taxonomies
  has_many :experiments, :through=>:pcrs
end
