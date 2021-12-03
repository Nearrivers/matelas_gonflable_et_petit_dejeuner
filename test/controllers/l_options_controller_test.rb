require "test_helper"

class LOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @l_option = l_options(:one)
  end

  test "should get index" do
    get l_options_url
    assert_response :success
  end

  test "should get new" do
    get new_l_option_url
    assert_response :success
  end

  test "should create l_option" do
    assert_difference('LOption.count') do
      post l_options_url, params: { l_option: { value: @l_option.value } }
    end

    assert_redirected_to l_option_url(LOption.last)
  end

  test "should show l_option" do
    get l_option_url(@l_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_l_option_url(@l_option)
    assert_response :success
  end

  test "should update l_option" do
    patch l_option_url(@l_option), params: { l_option: { value: @l_option.value } }
    assert_redirected_to l_option_url(@l_option)
  end

  test "should destroy l_option" do
    assert_difference('LOption.count', -1) do
      delete l_option_url(@l_option)
    end

    assert_redirected_to l_options_url
  end
end
