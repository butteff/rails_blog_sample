require 'rails_helper'

RSpec.describe "boards/show", type: :view do
  before(:each) do
    assign(:board, Board.create!(
      image: "Image",
      body: "MyText",
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
