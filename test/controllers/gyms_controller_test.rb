require 'test_helper'

class GymsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get gyms_index_url
    assert_response :success
  end

  test "should get show" do
    get gyms_show_url
    assert_response :success
  end

  test "should get new" do
    get gyms_new_url
    assert_response :success
  end

  test "should get create" do
    get gyms_create_url
    assert_response :success
  end

  test "should get edit" do
    get gyms_edit_url
    assert_response :success
  end

  test "should get update" do
    get gyms_update_url
    assert_response :success
  end

  test "should get destroy" do
    get gyms_destroy_url
    assert_response :success
  end

end
