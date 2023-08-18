require 'rails_helper'

describe Expenditure, type: :model do
  describe ' #index' do
    let(:first_user) { User.create(name: 'Tom') }
    let(:first_expense) do
      Expense.create(author: first_user, name: 'Apple', amount: 2000)
    end


    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'amount should be less than 251 ch' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
  end
end
