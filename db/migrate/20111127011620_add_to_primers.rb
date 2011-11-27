class AddToPrimers < ActiveRecord::Migration
  def up
		add_column :pcrs, :h2o, :string
		add_column :pcrs, :buffer, :string
		add_column :pcrs, :mgcl2, :string
		add_column :pcrs, :bsa, :string
		add_column :pcrs, :dntps, :string
		add_column :pcrs, :taq, :string
  end               

  def down
  end
end