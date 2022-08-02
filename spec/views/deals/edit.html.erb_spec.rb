require 'rails_helper'

RSpec.describe 'deals/edit', type: :view do
  before(:each) do
    @deal = assign(:deal, Deal.create!(
                            name: 'MyString',
                            amount: '9.99',
                            user: nil,
                            category: nil
                          ))
  end

  it 'renders the edit deal form' do
    render

    assert_select 'form[action=?][method=?]', deal_path(@deal), 'post' do
      assert_select 'input[name=?]', 'deal[name]'

      assert_select 'input[name=?]', 'deal[amount]'

      assert_select 'input[name=?]', 'deal[user_id]'

      assert_select 'input[name=?]', 'deal[category_id]'
    end
  end
end
