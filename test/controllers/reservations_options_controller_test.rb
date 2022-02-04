require "test_helper"

class ReservationsOptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reservations_option = reservations_options(:one)
  end

  test "should get index" do
    get reservations_options_url
    assert_response :success
  end

  test "should get new" do
    get new_reservations_option_url
    assert_response :success
  end

  test "should create reservations_option" do
    assert_difference('ReservationsOption.count') do
      post reservations_options_url, params: { reservations_option: { option_id: @reservations_option.option_id, reservation_id: @reservations_option.reservation_id } }
    end

    assert_redirected_to reservations_option_url(ReservationsOption.last)
  end

  test "should show reservations_option" do
    get reservations_option_url(@reservations_option)
    assert_response :success
  end

  test "should get edit" do
    get edit_reservations_option_url(@reservations_option)
    assert_response :success
  end

  test "should update reservations_option" do
    patch reservations_option_url(@reservations_option), params: { reservations_option: { option_id: @reservations_option.option_id, reservation_id: @reservations_option.reservation_id } }
    assert_redirected_to reservations_option_url(@reservations_option)
  end

  test "should destroy reservations_option" do
    assert_difference('ReservationsOption.count', -1) do
      delete reservations_option_url(@reservations_option)
    end

    assert_redirected_to reservations_options_url
  end
end
