require "application_system_test_case"

class LOptionsTest < ApplicationSystemTestCase
  setup do
    @l_option = l_options(:one)
  end

  test "visiting the index" do
    visit l_options_url
    assert_selector "h1", text: "L Options"
  end

  test "creating a L option" do
    visit l_options_url
    click_on "New L Option"

    fill_in "Value", with: @l_option.value
    click_on "Create L option"

    assert_text "L option was successfully created"
    click_on "Back"
  end

  test "updating a L option" do
    visit l_options_url
    click_on "Edit", match: :first

    fill_in "Value", with: @l_option.value
    click_on "Update L option"

    assert_text "L option was successfully updated"
    click_on "Back"
  end

  test "destroying a L option" do
    visit l_options_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "L option was successfully destroyed"
  end
end
