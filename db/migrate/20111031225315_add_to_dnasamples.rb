class AddToDnasamples < ActiveRecord::Migration
  def up
		add_column :dnasamples, :location_collected, :string
		add_column :dnasamples, :specimen_gender, :string
		add_column :dnasamples, :collector_number, :integer
		
  end

  def down
	remove_column :dnasamples, :location_collected
	remove_column :dnasamples, :specimen_gender
	remove_column :dnasamples, :collector_number
  end
end