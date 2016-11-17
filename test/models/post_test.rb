require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = users(:paul)
    @post = @user.posts.build(post_type: "post", content: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "post_type should be present" do
    @post.post_type = "   "
    assert_not @post.valid?
  end
  
  test "type should be only accepted values" do
    unless @post.post_type = "post" || "wordkout" || "meal"
    assert_not @post.valid?
    end
  end

  test "content should be present" do
    @post.content = "   "
    assert_not @post.valid?
  end
  
  test "order should be most recent first" do
    assert_equal posts(:most_recent), Post.first
  end

end