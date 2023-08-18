class Expenditure < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :expenditures_expenses
  has_many :expenses, through: :expenditures_expenses


  validates :name, presence: true
  validates :amount, presence: true
end
