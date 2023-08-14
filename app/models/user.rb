class User < ApplicationRecord
    has_many :expenditures
    has_many :expenses

    validates :name, presence: true
end
