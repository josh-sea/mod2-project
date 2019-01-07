class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :rep_id
      t.integer :system_id

      t.timestamps
    end
  end
end
