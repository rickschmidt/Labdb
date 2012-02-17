class AddTubes < ActiveRecord::Migration
  def up
	create_table :tubes do |t|
      t.column "primer_id", :integer
      t.column "pcr_id", :integer
      t.timestamps
    end
  end

  def down
	drop_table :tubes
  end
end
