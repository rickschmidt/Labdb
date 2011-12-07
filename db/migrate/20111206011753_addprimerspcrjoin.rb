class Addprimerspcrjoin < ActiveRecord::Migration
  def up
	 create_table :pcrs_primers, :id => false do |t|
      t.column "primer_id", :integer
      t.column "pcr_id", :integer
      t.timestamps
    end
  end

  def down
	drop_table :pcrs_primers
  end
end
