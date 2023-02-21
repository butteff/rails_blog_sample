require 'rails_helper'

RSpec.describe "boards/edit", type: :view do
  let(:board) {
    Board.create!(
      image: "MyString",
      body: "MyText",
      user: nil
    )
  }

  before(:each) do
    assign(:board, board)
  end

  it "renders the edit board form" do
    render

    assert_select "form[action=?][method=?]", board_path(board), "post" do

      assert_select "input[name=?]", "board[image]"

      assert_select "textarea[name=?]", "board[body]"

      assert_select "input[name=?]", "board[user_id]"
    end
  end
end
