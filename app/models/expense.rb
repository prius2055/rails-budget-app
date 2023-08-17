class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expenditures_expenses
  has_many :expenditures, through: :expenditures_expenses
 

  validates :name, presence: true
  validates :icon, presence: true
end
