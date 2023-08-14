class Expense < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :expenditures

  validates :name, presence: true
  validates :icon, presence: true
end
