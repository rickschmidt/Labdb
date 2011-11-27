class AddToDnasamplesMuseum < ActiveRecord::Migration
  def up
		add_column :dnasamples, :museum, :string
		add_column :dnasamples, :sample_type, :string
		
  end

  def down
  end
end