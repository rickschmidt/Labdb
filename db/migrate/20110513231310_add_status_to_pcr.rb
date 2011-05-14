class AddStatusToPcr < ActiveRecord::Migration
  def self.up
        add_column :pcrs, :success, :boolean
        add_column :pcrs, :ready, :boolean
  end

  def self.down
        remove_column :pcrs, :success
        remove_column :pcrs, :ready
  end
end