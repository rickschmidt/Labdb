class Pcr < ActiveRecord::Base
  has_and_belongs_to_many :dnasamples #has one dnasample
  has_and_belongs_to_many :projects
end
