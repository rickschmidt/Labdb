class CreatePrimers < ActiveRecord::Migration
  def self.up
    create_table :primers do |t|
      t.string :primerh
      t.string :primerl

      t.timestamps
    end
  end

  def self.down
    drop_table :primers
  end
end
