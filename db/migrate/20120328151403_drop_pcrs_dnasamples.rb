class DropPcrsDnasamples < ActiveRecord::Migration
  def self.up
    drop_table :dnasamples_pcrs 
  end

  def self.down
  end
end
