require "test_helper"

class UserFavsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_fav = user_favs(:one)
  end

  test "should get index" do
    get user_favs_url
    assert_response :success
  end

  test "should get new" do
    get new_user_fav_url
    assert_response :success
  end

  test "should create user_fav" do
    assert_difference('UserFav.count') do
      post user_favs_url, params: { user_fav: { location_id: @user_fav.location_id, user_id: @user_fav.user_id } }
    end

    assert_redirected_to user_fav_url(UserFav.last)
  end

  test "should show user_fav" do
    get user_fav_url(@user_fav)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_fav_url(@user_fav)
    assert_response :success
  end

  test "should update user_fav" do
    patch user_fav_url(@user_fav), params: { user_fav: { location_id: @user_fav.location_id, user_id: @user_fav.user_id } }
    assert_redirected_to user_fav_url(@user_fav)
  end

  test "should destroy user_fav" do
    assert_difference('UserFav.count', -1) do
      delete user_fav_url(@user_fav)
    end

    assert_redirected_to user_favs_url
  end
end
