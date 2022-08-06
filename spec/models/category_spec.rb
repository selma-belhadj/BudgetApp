require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:each) do
    @user = User.create(name: 'Amira', email: 'amira@gmail.com', password: '123456')
    @category = Category.create(name: 'Food', icon: 'food_url', user_id: @user.id)
  end
  it 'is valid with valid attributes' do
    expect(@category).to be_valid
  end

  it 'is not valid without a name' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'is not valid without an icon' do
    @category.icon = nil
    expect(@category).to_not be_valid
  end

  it 'is not valid without a user_id' do
    @category.user_id = nil
    expect(@category).to_not be_valid
  end

  it 'is not valid with a duplicate name' do
    @category.save
    category_duplicate = Category.new(name: 'Food', icon: 'food_url', user_id: @user.id)
    expect(category_duplicate).to_not be_valid
  end

  it 'is not valid with name length is more than 50 characters' do
    @category.name = 'm' * 51
    expect(@category).to_not be_valid
  end
end
