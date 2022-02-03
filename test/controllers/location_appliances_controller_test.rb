require "test_helper"

class LocationAppliancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location_appliance = location_appliances(:one)
  end

  test "should get index" do
    get location_appliances_url
    assert_response :success
  end

  test "should get new" do
    get new_location_appliance_url
    assert_response :success
  end

  test "should create location_appliance" do
    assert_difference('LocationAppliance.count') do
      post location_appliances_url, params: { location_appliance: { appliance_id: @location_appliance.appliance_id, location_id: @location_appliance.location_id } }
    end

    assert_redirected_to location_appliance_url(LocationAppliance.last)
  end

  test "should show location_appliance" do
    get location_appliance_url(@location_appliance)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_appliance_url(@location_appliance)
    assert_response :success
  end

  test "should update location_appliance" do
    patch location_appliance_url(@location_appliance), params: { location_appliance: { appliance_id: @location_appliance.appliance_id, location_id: @location_appliance.location_id } }
    assert_redirected_to location_appliance_url(@location_appliance)
  end

  test "should destroy location_appliance" do
    assert_difference('LocationAppliance.count', -1) do
      delete location_appliance_url(@location_appliance)
    end

    assert_redirected_to location_appliances_url
  end
end
