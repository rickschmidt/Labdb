class Addprimtertogenetable < ActiveRecord::Migration
  def self.up
        add_column :genes, :primer, :string
  end

  def self.down
        remove_column :genes, :primer
  end
end