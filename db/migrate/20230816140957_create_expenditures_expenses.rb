class CreateExpendituresExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenditures_expenses do |t|
      t.references :expenditure, null: false, foreign_key: true
      t.references :expense, null: false, foreign_key: true

      t.timestamps
    end
  end
end
