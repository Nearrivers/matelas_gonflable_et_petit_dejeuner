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

    fill_in "Avg score", with: @location.avg_score
    fill_in "City", with: @location.city
    fill_in "Description", with: @location.description
    fill_in "Lat", with: @location.lat
    fill_in "Long", with: @location.long
    fill_in "Name", with: @location.name
    fill_in "Nb bed", with: @location.nb_bed
    fill_in "Nb room", with: @location.nb_room
    fill_in "Price", with: @location.price
    fill_in "Street", with: @location.street
    fill_in "Type location", with: @location.type_location
    fill_in "Zip code", with: @location.zip_code
    click_on "Create Location"

    assert_text "Location was successfully created"
    click_on "Back"
  end

  test "updating a Location" do
    visit locations_url
    click_on "Edit", match: :first

    fill_in "Avg score", with: @location.avg_score
    fill_in "City", with: @location.city
    fill_in "Description", with: @location.description
    fill_in "Lat", with: @location.lat
    fill_in "Long", with: @location.long
    fill_in "Name", with: @location.name
    fill_in "Nb bed", with: @location.nb_bed
    fill_in "Nb room", with: @location.nb_room
    fill_in "Price", with: @location.price
    fill_in "Street", with: @location.street
    fill_in "Type location", with: @location.type_location
    fill_in "Zip code", with: @location.zip_code
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
