class CreateTaxonomies < ActiveRecord::Migration
  def self.up
    create_table :taxonomies do |t|
      t.string :genus
      t.string :species
      t.string :subspecies
      t.string :new_diagnosis
      t.string :family
      t.string :reference
      t.string :description_pdf
      t.string :synonyms
      t.string :type_museum
      t.string :distribution
      t.string :ingroup
      t.string :other_literature
      t.string :character_diagnosis
      t.string :description
      t.string :countries

      t.timestamps
    end
  end

  def self.down
    drop_table :taxonomies
  end
end
