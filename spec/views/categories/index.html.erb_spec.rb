require 'rails_helper'

RSpec.describe "categories/index", type: :view do
  before(:each) do
    assign(:categories, [
      Category.create!(
        name: "Name",
        icon: "Icon",
        User: nil
      ),
      Category.create!(
        name: "Name",
        icon: "Icon",
        User: nil
      )
    ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Icon".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
