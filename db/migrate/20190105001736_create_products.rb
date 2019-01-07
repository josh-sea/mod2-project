class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :system_id
      t.integer :test_id

      t.timestamps
    end
  end
end
