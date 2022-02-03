require "application_system_test_case"

class LocationAppliancesTest < ApplicationSystemTestCase
  setup do
    @location_appliance = location_appliances(:one)
  end

  test "visiting the index" do
    visit location_appliances_url
    assert_selector "h1", text: "Location Appliances"
  end

  test "creating a Location appliance" do
    visit location_appliances_url
    click_on "New Location Appliance"

    fill_in "Appliance", with: @location_appliance.appliance_id
    fill_in "Location", with: @location_appliance.location_id
    click_on "Create Location appliance"

    assert_text "Location appliance was successfully created"
    click_on "Back"
  end

  test "updating a Location appliance" do
    visit location_appliances_url
    click_on "Edit", match: :first

    fill_in "Appliance", with: @location_appliance.appliance_id
    fill_in "Location", with: @location_appliance.location_id
    click_on "Update Location appliance"

    assert_text "Location appliance was successfully updated"
    click_on "Back"
  end

  test "destroying a Location appliance" do
    visit location_appliances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Location appliance was successfully destroyed"
  end
end
