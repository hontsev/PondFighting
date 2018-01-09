require 'test_helper'

class MatchControllerTest < ActionDispatch::IntegrationTest
  test "should get showmatches" do
    get match_showmatches_url
    assert_response :success
  end

  test "should get showdetail" do
    get match_showdetail_url
    assert_response :success
  end

  test "should get showreplay" do
    get match_showreplay_url
    assert_response :success
  end

  test "should get singlefight" do
    get match_singlefight_url
    assert_response :success
  end

  test "should get multifight" do
    get match_multifight_url
    assert_response :success
  end

  test "should get loopfight" do
    get match_loopfight_url
    assert_response :success
  end

  test "should get fightover" do
    get match_fightover_url
    assert_response :success
  end

end
