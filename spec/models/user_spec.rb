require 'rails_helper'

describe User, type: :model do
  subject { User.new(name: 'Tim') }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
