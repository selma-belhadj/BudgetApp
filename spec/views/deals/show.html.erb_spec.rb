require 'rails_helper'

RSpec.describe "deals/show", type: :view do
  before(:each) do
    @deal = assign(:deal, Deal.create!(
      name: "Name",
      amount: "9.99",
      user: nil,
      category: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
