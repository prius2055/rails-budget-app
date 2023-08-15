class CreateJoinTableExpensesExpenditures < ActiveRecord::Migration[7.0]
  def change
    create_join_table :expenses, :expenditures do |t|
      # t.index [:expense_id, :expenditure_id]
      # t.index [:expenditure_id, :expense_id]
    end
  end
end
