class CreateReps < ActiveRecord::Migration[5.2]
  def change
    create_table :reps do |t|
      t.string :name
      t.string :region
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
