require 'rails_helper'

describe Expenditure, type: :request do
  before(:each) do
    @user = User.create(name: 'Leon', email: 'leon@gmail.com', password: '123456', password_confirmation: '123456')
     
    @expenditure = Expenditure.create(name: 'BBQ', amount: 2000, author_id:@user.id)
  end

  it 'should render user name' do
    expect(@user.name).to eq('Leon')
  end

  it 'should render category name' do
    expect(@expenditure.name).to eq('BBQ')
  end
end
