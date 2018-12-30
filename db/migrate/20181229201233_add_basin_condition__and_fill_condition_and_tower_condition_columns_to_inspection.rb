class AddBasinConditionAndFillConditionAndTowerConditionColumnsToInspection < ActiveRecord::Migration[5.2]
  def change
    add_column :inspections, :basin_condition, :string
    add_column :inspections, :tower_condition, :string
    add_column :inspections, :fill_condition, :string
  end
end
