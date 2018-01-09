require 'test_helper'

class AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get regist" do
    get account_regist_url
    assert_response :success
  end

  test "should get login" do
    get account_login_url
    assert_response :success
  end

  test "should get logout" do
    get account_logout_url
    assert_response :success
  end

end
