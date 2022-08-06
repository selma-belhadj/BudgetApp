require 'rails_helper'

RSpec.describe Deal, type: :model do
  before(:each) do
    @user = User.create(name: 'Amira', email: 'amira@gmail.com', password: '123456')
    @category = Category.create(name: 'Food', icon: 'food_url', user_id: @user.id)
    @deal = Deal.create(name: 'Apples', amount: 100, category_id: @category.id, user_id: @user.id)
  end

  it 'is valid with valid attributes' do
    expect(@deal).to be_valid
  end

  it 'is not valid without a name' do
    @deal.name = nil
    expect(@deal).to_not be_valid
  end

  it 'is not valid without an amount' do
    @deal.amount = nil
    expect(@deal).to_not be_valid
  end

  it 'is not valid without a category' do
    @deal.category_id = nil
    expect(@deal).to_not be_valid
  end

  it 'is not valid without a user' do
    @deal.user_id = nil
    expect(@deal).to_not be_valid
  end

  it 'is not valid with a name longer than 50 characters' do
    @deal.name = 'a' * 51
    expect(@deal).to_not be_valid
  end

  it 'is not valid with an amount less than 0' do
    @deal.amount = -1
    expect(@deal).to_not be_valid
  end

  it 'is not valid with a category that does not belong to the user' do
    @deal.category_id = @category.id + 1
    expect(@deal).to_not be_valid
  end

  it 'is not valid with a user that does not belong to the category' do
    @deal.user_id = @user.id + 1
    expect(@deal).to_not be_valid
  end
end
