class CreateSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :systems do |t|
      t.string :system_type
      t.string :treatment_comment
      t.boolean :seasonal
      t.integer :account_id

      t.timestamps
    end
  end
end
