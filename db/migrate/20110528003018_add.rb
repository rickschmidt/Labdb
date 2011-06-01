class Add < ActiveRecord::Migration
  def self.up
      create_table :dnasamples_experiments, :id => false do |t|
      t.column "dnasample_id", :integer
      t.column "experiment_id", :integer
      t.timestamps
    end
  end

  def self.down
      drop_table :dnasamples_experiments
  end
end
