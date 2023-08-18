class ExpendituresExpense < ApplicationRecord
  belongs_to :expenditure
  belongs_to :expense
end
