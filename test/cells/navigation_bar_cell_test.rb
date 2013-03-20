require 'test_helper'

class NavigationBarCellTest < Cell::TestCase
  test "left_side_menu" do
    invoke :left_side_menu
    assert_select "p"
  end
  

end
