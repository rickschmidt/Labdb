class Jointables < ActiveRecord::Migration
  def self.up
    create_table :dnasamples_genes, :id => false do |t|
      t.column "dnasample_id", :integer
      t.column "gene_id", :integer
      t.timestamps
    end
    
    create_table :dnasamples_pcrs, :id=>false do |t|
      t.column "dnasample_id", :integer
      t.column "pcr_id", :integer
      t.timestamps
  end
  

  end

  def self.down
    drop_table :dnasamples_genes
    drop_table :dnasamples_pcrs
    
  end
end