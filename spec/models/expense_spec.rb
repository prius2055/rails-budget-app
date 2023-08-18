require 'rails_helper'

describe Expense, type: :model do
  describe ' #index' do
    let(:first_user) { User.create(name: 'Tom') }
    let(:first_expense) do
      Expense.create(author: first_user, name: 'Apple', icon: 'https://unsplash.com/photos/F_-0BxGuVvo')
    end

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'icon should be less than 251 ch' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end
end
