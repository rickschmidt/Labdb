class CreatePcrs < ActiveRecord::Migration
  def self.up
    create_table :pcrs do |t|
      t.string :pcr_tube_number
      t.string :gel_image
      t.date :date
      t.float :anneal_temp
      t.float :dna_amount
      t.string :conditions
      t.integer :total_samples
      t.string :notes
      t.string :reamp
      t.integer :total_worked
      t.float :denature
      t.float :extension
      t.float :cycle
      t.string :primerl
      t.string :primerh

      t.timestamps
    end
  end

  def self.down
    drop_table :pcrs
  end
end
