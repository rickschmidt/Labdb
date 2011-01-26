class CreateDnasamples < ActiveRecord::Migration
  def self.up
    create_table :dnasamples do |t|
      t.string :dna_accession
      t.string :dnasample_number
      t.date :date
      t.string :method
      t.float :elution_volume
      t.string :second_elute
      t.float :second_elute_volumne
      t.string :reextracted
      t.string :created_by

      t.timestamps
    end
  end

  def self.down
    drop_table :dnasamples
  end
end
