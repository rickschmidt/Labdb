class Dnataxjoin < ActiveRecord::Migration
  def self.up
      
      create_table :dnasamples_taxonomies, :id=>false do |t|
      t.column "dnasample_id", :integer
      t.column "taxonomy_id", :integer
      t.timestamps
  end
  end

  def self.down
      drop_table :dnasamples_taxonomies
  end
end
