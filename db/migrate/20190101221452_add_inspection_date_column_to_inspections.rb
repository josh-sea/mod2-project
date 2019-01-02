class AddInspectionDateColumnToInspections < ActiveRecord::Migration[5.2]
  def change
    add_column :inspections, :inspection_date, :datetime
  end
end
