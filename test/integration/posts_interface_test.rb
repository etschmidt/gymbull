require 'test_helper'

class PostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:paul)
  end

  test "post interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    
    # Invalid submission
    assert_no_difference 'Post.count' do
      post posts_path, params: { post_type: "", post: { content: "" } }
    end
    assert_select 'div#error_explanation'
    
    # Valid submission
    post_type = "post"
    content = "This post really ties the room together"
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: { post_type: post_type, content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    
    # Delete post
    assert_select 'a', text: 'delete'
    first_post = @user.posts.paginate(page: 1).first
    assert_difference 'Post.count', -1 do
      delete post_path(first_post)
    end
    
    # Visit different user (no delete links)
    get user_path(users(:duncan))
    assert_select 'a', text: 'delete', count: 0
  end
end