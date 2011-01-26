class CreateGenes < ActiveRecord::Migration
  def self.up
    create_table :genes do |t|
      t.string :genbank
      t.string :locus
      t.string :primerl
      t.string :primerh

      t.timestamps
    end
  end

  def self.down
    drop_table :genes
  end
end
