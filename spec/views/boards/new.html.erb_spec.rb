require 'rails_helper'

RSpec.describe "boards/new", type: :view do
  before(:each) do
    assign(:board, Board.new(
      image: "MyString",
      body: "MyText",
      user: nil
    ))
  end

  it "renders new board form" do
    render

    assert_select "form[action=?][method=?]", boards_path, "post" do

      assert_select "input[name=?]", "board[image]"

      assert_select "textarea[name=?]", "board[body]"

      assert_select "input[name=?]", "board[user_id]"
    end
  end
end
