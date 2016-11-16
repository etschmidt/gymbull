require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Gymbull"
    assert_equal full_title("Help"), "Help | Gymbull"
  end
end