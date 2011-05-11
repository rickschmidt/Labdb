class AddNameToPrimers < ActiveRecord::Migration
  def self.up
        add_column :primers, :name, :string
  end

  def self.down
        remove_column :primers, :name
  end
end