require "application_system_test_case"

class VotersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @election = elections(:one)
  end

  test "visiting the index" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"
    click_on "Show", match: :first

    click_on "Voters"

    assert_selector "h1", text: "Voters"

    assert_text @election.voters.first.name
    assert_text @election.voters.first.email
    assert_text @election.name
  end

  test "showing a Voter" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"
    click_on "Show", match: :first

    click_on "Voters"

    click_on "Show", match: :first

    assert_text @election.voters.first.name
    assert_text @election.voters.first.email
    assert_text @election.name

    click_on "Back"
  end

  test "creating a Voter" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"
    click_on "Show", match: :first

    click_on "Voters"

    click_on "New Voter"

    fill_in "Name", with: 'Voter Create'
    fill_in "Email", with: 'johndoe@email.com'
    click_on "Create Voter"

    assert_text "Voter was successfully created"
    click_on "Back"
  end

  test "updating a Voter" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"
    click_on "Show", match: :first

    click_on "Voters"

    click_on "Edit", match: :first

    fill_in "Name", with: 'Voter Update'
    fill_in "Email", with: 'johndoe@email.com'
    click_on "Update Voter"

    assert_text "Voter was successfully updated"
    click_on "Back"
  end

  test "destroying a Voter" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"
    click_on "Show", match: :first

    click_on "Voters"

    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Voter was successfully destroyed"
  end
end
