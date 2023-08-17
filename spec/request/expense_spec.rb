require 'rails_helper'

describe Expense, type: :request do
  before(:each) do
    @user = User.create(name: 'Leon', email: 'leon@gmail.com', password: '123456', password_confirmation: '123456')
    @expense = Expense.create(name: 'KFC', icon: 'https://unsplash.com/photos/F_-0BxGuVvo', author_id:@user.id )
  end

  it 'should return a successful response' do
    get expenses_path(@user)
    expect(response).to be_successful
  end

  it 'should render user name' do
    expect(@user.name).to eq('Leon')
  end

  it 'should render category name' do
    expect(@expense.name).to eq('KFC')
  end
end
