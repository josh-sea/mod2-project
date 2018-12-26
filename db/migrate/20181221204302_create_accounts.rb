class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :acct_num
      t.belongs_to :rep, foreign_key: true

      t.timestamps
    end
  end
end
