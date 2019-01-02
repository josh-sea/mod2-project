class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :rep_id
      t.integer :account_id

      t.timestamps
    end
  end
end
