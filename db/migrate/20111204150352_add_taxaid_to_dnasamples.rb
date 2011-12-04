class AddTaxaidToDnasamples < ActiveRecord::Migration
  def change
		add_column :dnasamples, :taxonomy_id, :integer
  end
end