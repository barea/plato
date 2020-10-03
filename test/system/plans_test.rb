require "application_system_test_case"

class PlansTest < ApplicationSystemTestCase
  setup do
    @plan = plans(:one)
  end

  test "visiting the index" do
    visit plans_url
    assert_selector "h1", text: "Plans"
  end

  test "creating a Plan" do
    visit plans_url
    click_on "New Plan"

    check "Active" if @plan.active
    fill_in "Annual licence price", with: @plan.annual_licence_price
    fill_in "Licence boards num", with: @plan.licence_boards_num
    fill_in "Licence seats num", with: @plan.licence_seats_num
    fill_in "Monthly board price", with: @plan.monthly_board_price
    fill_in "Monthly licence price", with: @plan.monthly_licence_price
    fill_in "Monthly seat price", with: @plan.monthly_seat_price
    fill_in "Name", with: @plan.name
    click_on "Create Plan"

    assert_text "Plan was successfully created"
    click_on "Back"
  end

  test "updating a Plan" do
    visit plans_url
    click_on "Edit", match: :first

    check "Active" if @plan.active
    fill_in "Annual licence price", with: @plan.annual_licence_price
    fill_in "Licence boards num", with: @plan.licence_boards_num
    fill_in "Licence seats num", with: @plan.licence_seats_num
    fill_in "Monthly board price", with: @plan.monthly_board_price
    fill_in "Monthly licence price", with: @plan.monthly_licence_price
    fill_in "Monthly seat price", with: @plan.monthly_seat_price
    fill_in "Name", with: @plan.name
    click_on "Update Plan"

    assert_text "Plan was successfully updated"
    click_on "Back"
  end

  test "destroying a Plan" do
    visit plans_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Plan was successfully destroyed"
  end
end
