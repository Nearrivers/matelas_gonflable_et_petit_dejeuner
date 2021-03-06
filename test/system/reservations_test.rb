require "application_system_test_case"

class ReservationsTest < ApplicationSystemTestCase
  setup do
    @reservation = reservations(:one)
  end

  test "visiting the index" do
    visit reservations_url
    assert_selector "h1", text: "Reservations"
  end

  test "creating a Reservation" do
    visit reservations_url
    click_on "New Reservation"

    fill_in "Date in", with: @reservation.date_in
    fill_in "Date out", with: @reservation.date_out
    fill_in "Location", with: @reservation.location_id
    fill_in "Nb people", with: @reservation.nb_people
    fill_in "Price", with: @reservation.price
    check "Status" if @reservation.status
    fill_in "Stripe reference", with: @reservation.stripe_reference
    fill_in "User", with: @reservation.user_id
    click_on "Create Reservation"

    assert_text "Reservation was successfully created"
    click_on "Back"
  end

  test "updating a Reservation" do
    visit reservations_url
    click_on "Edit", match: :first

    fill_in "Date in", with: @reservation.date_in
    fill_in "Date out", with: @reservation.date_out
    fill_in "Location", with: @reservation.location_id
    fill_in "Nb people", with: @reservation.nb_people
    fill_in "Price", with: @reservation.price
    check "Status" if @reservation.status
    fill_in "Stripe reference", with: @reservation.stripe_reference
    fill_in "User", with: @reservation.user_id
    click_on "Update Reservation"

    assert_text "Reservation was successfully updated"
    click_on "Back"
  end

  test "destroying a Reservation" do
    visit reservations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Reservation was successfully destroyed"
  end
end
