require "application_system_test_case"

class AppliancesTest < ApplicationSystemTestCase
  setup do
    @appliance = appliances(:one)
  end

  test "visiting the index" do
    visit appliances_url
    assert_selector "h1", text: "Appliances"
  end

  test "creating a Appliance" do
    visit appliances_url
    click_on "New Appliance"

    fill_in "Category", with: @appliance.category_id
    fill_in "Value", with: @appliance.value
    click_on "Create Appliance"

    assert_text "Appliance was successfully created"
    click_on "Back"
  end

  test "updating a Appliance" do
    visit appliances_url
    click_on "Edit", match: :first

    fill_in "Category", with: @appliance.category_id
    fill_in "Value", with: @appliance.value
    click_on "Update Appliance"

    assert_text "Appliance was successfully updated"
    click_on "Back"
  end

  test "destroying a Appliance" do
    visit appliances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Appliance was successfully destroyed"
  end
end
