class MoreJoins < ActiveRecord::Migration
  def self.up
    
    create_table :experiments_pcrs, :id => false do |t|
      t.column "experiment_id", :integer
      t.column "pcr_id", :integer
      t.timestamps
    end
    
  end

  def self.down
    drop_table :experiments_pcrs
    
  end
end
