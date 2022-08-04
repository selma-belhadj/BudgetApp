require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Amira', email: 'amira@gmail.com', password: '123456')
  end

  it 'is valid with valid attributes' do
    expect(@user).to be_valid
  end

  it 'is not valid without a name' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without an email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid without a password' do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  it 'is not valid with a duplicate email' do
    @user.save
    user_duplicate = User.new(name: 'mira', email: 'amira@gmail.com', password: '123456')
    expect(user_duplicate).to_not be_valid
  end

  it 'is not valid with a password less than 6 characters' do
    @user.password = '12345'
    expect(@user).to_not be_valid
  end

  it 'is not valid with name length is more than 50 characters' do
    @user.name = 'm' * 51
    expect(@user).to_not be_valid
  end
end
