class CreateTests < ActiveRecord::Migration[5.2]
  def change
    create_table :tests do |t|
      t.string :name
      t.float :reading
      t.string :comment
      t.integer :report_id
      
      t.timestamps
    end
  end
end
