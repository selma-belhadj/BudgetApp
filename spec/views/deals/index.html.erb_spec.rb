require 'rails_helper'

RSpec.describe "deals/index", type: :view do
  before(:each) do
    assign(:deals, [
      Deal.create!(
        name: "Name",
        amount: "9.99",
        user: nil,
        category: nil
      ),
      Deal.create!(
        name: "Name",
        amount: "9.99",
        user: nil,
        category: nil
      )
    ])
  end

  it "renders a list of deals" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "9.99".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
