require 'test_helper'

class DuckControllerTest < ActionDispatch::IntegrationTest
  test "should get myscript" do
    get duck_myscript_url
    assert_response :success
  end

  test "should get createscript" do
    get duck_createscript_url
    assert_response :success
  end

  test "should get editscript" do
    get duck_editscript_url
    assert_response :success
  end

  test "should get deletescript" do
    get duck_deletescript_url
    assert_response :success
  end

  test "should get search" do
    get duck_search_url
    assert_response :success
  end

end
