class AddSeqColToPrimer < ActiveRecord::Migration
  def self.up
        add_column :primers, :sequence, :string
  end

  def self.down
        remove_column :primers, :column_name
  end
end