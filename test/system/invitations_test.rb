require "application_system_test_case"

class InvitationsTest < ApplicationSystemTestCase
  setup do
    @invitation = invitations(:one)
  end

  test "visiting the index" do
    visit invitations_url
    assert_selector "h1", text: "Invitations"
  end

  test "creating a Invitation" do
    visit invitations_url
    click_on "New Invitation"

    fill_in "Code", with: @invitation.code
    fill_in "Expire at", with: @invitation.expire_at
    fill_in "Invited by user", with: @invitation.invited_by_user_id
    fill_in "Orgnization", with: @invitation.orgnization_id
    fill_in "Used by user", with: @invitation.used_by_user_id
    click_on "Create Invitation"

    assert_text "Invitation was successfully created"
    click_on "Back"
  end

  test "updating a Invitation" do
    visit invitations_url
    click_on "Edit", match: :first

    fill_in "Code", with: @invitation.code
    fill_in "Expire at", with: @invitation.expire_at
    fill_in "Invited by user", with: @invitation.invited_by_user_id
    fill_in "Orgnization", with: @invitation.orgnization_id
    fill_in "Used by user", with: @invitation.used_by_user_id
    click_on "Update Invitation"

    assert_text "Invitation was successfully updated"
    click_on "Back"
  end

  test "destroying a Invitation" do
    visit invitations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invitation was successfully destroyed"
  end
end
