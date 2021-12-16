require "application_system_test_case"

class LocationsTest < ApplicationSystemTestCase
  setup do
    @location = locations(:one)
  end

  test "visiting the index" do
    visit locations_url
    assert_selector "h1", text: "Locations"
  end

  test "creating a Location" do
    visit locations_url
    click_on "New Location"

    fill_in "Avgscore", with: @location.avgScore
    fill_in "City", with: @location.city
    fill_in "Description", with: @location.description
    fill_in "Equipments", with: @location.equipments_id
    fill_in "Feedbacks", with: @location.feedbacks_id
    fill_in "Lat", with: @location.lat
    fill_in "Locationoptions", with: @location.locationOptions_id
    fill_in "Long", with: @location.long
    fill_in "Name", with: @location.name
    fill_in "Nbbed", with: @location.nbBed
    fill_in "Nbroom", with: @location.nbRoom
    fill_in "Price", with: @location.price
    fill_in "Reservation", with: @location.reservation_id
    fill_in "Street", with: @location.street
    fill_in "Type", with: @location.type
    fill_in "Zipcode", with: @location.zipcode
    click_on "Create Location"

    assert_text "Location was successfully created"
    click_on "Back"
  end

  test "updating a Location" do
    visit locations_url
    click_on "Edit", match: :first

    fill_in "Avgscore", with: @location.avgScore
    fill_in "City", with: @location.city
    fill_in "Description", with: @location.description
    fill_in "Equipments", with: @location.equipments_id
    fill_in "Feedbacks", with: @location.feedbacks_id
    fill_in "Lat", with: @location.lat
    fill_in "Locationoptions", with: @location.locationOptions_id
    fill_in "Long", with: @location.long
    fill_in "Name", with: @location.name
    fill_in "Nbbed", with: @location.nbBed
    fill_in "Nbroom", with: @location.nbRoom
    fill_in "Price", with: @location.price
    fill_in "Reservation", with: @location.reservation_id
    fill_in "Street", with: @location.street
    fill_in "Type", with: @location.type
    fill_in "Zipcode", with: @location.zipcode
    click_on "Update Location"

    assert_text "Location was successfully updated"
    click_on "Back"
  end

  test "destroying a Location" do
    visit locations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Location was successfully destroyed"
  end
end
