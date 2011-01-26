class CreateExperiments < ActiveRecord::Migration
  def self.up
    create_table :experiments do |t|
      t.date :date
      t.float :anneal
      t.float :dna_amount
      t.integer :total_samples
      t.string :notes
      t.string :experiment_number
      t.string :bsa
      t.string :buffer
      t.string :mgcl2
      t.string :taq
      t.string :h2o
      t.string :dntps
      t.string :dna
      t.float :primerl_amount
      t.float :primerh_amount
      t.integer :total
      t.string :primerl
      t.string :primerh

      t.timestamps
    end
  end

  def self.down
    drop_table :experiments
  end
end
