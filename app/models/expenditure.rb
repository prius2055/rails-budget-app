class Expenditure < ApplicationRecord
  belongs_to :author
  has_and_belongs_to_many :expenses

  validates :name, presence: true
  validates :amount, presence: true
end
