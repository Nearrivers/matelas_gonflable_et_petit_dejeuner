require "application_system_test_case"

class ReservationsOptionsTest < ApplicationSystemTestCase
  setup do
    @reservations_option = reservations_options(:one)
  end

  test "visiting the index" do
    visit reservations_options_url
    assert_selector "h1", text: "Reservations Options"
  end

  test "creating a Reservations option" do
    visit reservations_options_url
    click_on "New Reservations Option"

    fill_in "Option", with: @reservations_option.option_id
    fill_in "Reservation", with: @reservations_option.reservation_id
    click_on "Create Reservations option"

    assert_text "Reservations option was successfully created"
    click_on "Back"
  end

  test "updating a Reservations option" do
    visit reservations_options_url
    click_on "Edit", match: :first

    fill_in "Option", with: @reservations_option.option_id
    fill_in "Reservation", with: @reservations_option.reservation_id
    click_on "Update Reservations option"

    assert_text "Reservations option was successfully updated"
    click_on "Back"
  end

  test "destroying a Reservations option" do
    visit reservations_options_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reservations option was successfully destroyed"
  end
end
