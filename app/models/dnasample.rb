class Dnasample < ActiveRecord::Base
  has_and_belongs_to_many :genes
  has_and_belongs_to_many :pcr
  belongs_to :taxonomies
end
