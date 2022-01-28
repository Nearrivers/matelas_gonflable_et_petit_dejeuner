require "application_system_test_case"

class UserFavsTest < ApplicationSystemTestCase
  setup do
    @user_fav = user_favs(:one)
  end

  test "visiting the index" do
    visit user_favs_url
    assert_selector "h1", text: "User Favs"
  end

  test "creating a User fav" do
    visit user_favs_url
    click_on "New User Fav"

    fill_in "Location", with: @user_fav.location_id
    fill_in "User", with: @user_fav.user_id
    click_on "Create User fav"

    assert_text "User fav was successfully created"
    click_on "Back"
  end

  test "updating a User fav" do
    visit user_favs_url
    click_on "Edit", match: :first

    fill_in "Location", with: @user_fav.location_id
    fill_in "User", with: @user_fav.user_id
    click_on "Update User fav"

    assert_text "User fav was successfully updated"
    click_on "Back"
  end

  test "destroying a User fav" do
    visit user_favs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User fav was successfully destroyed"
  end
end
