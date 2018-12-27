class CreateInspections < ActiveRecord::Migration[5.2]
  def change
    create_table :inspections do |t|
      t.string :model
      t.string :reg_num
      t.integer :system_id
      t.integer :account_id

      t.timestamps
    end
  end
end
