class DnasampleTypeNameChanges < ActiveRecord::Migration
  def up
		rename_column :dnasamples, :elution_volume, :first_elution_volume
		rename_column :dnasamples, :second_elute_volumne, :second_elution_volume
  end

  def down
  end
end