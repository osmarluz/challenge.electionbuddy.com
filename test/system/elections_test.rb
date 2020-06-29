require "application_system_test_case"

class ElectionsTest < ApplicationSystemTestCase
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

    assert_selector "h1", text: "Elections"

    assert_text @election.name
    assert_text @election.start_at
    assert_text @election.end_at
    assert_text @election.visibility
  end

  test "showing an Election" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"

    click_on "Show", match: :first

    assert_text @election.name
    assert_text @election.start_at
    assert_text @election.end_at
    assert_text @election.visibility

    click_on "Back"
  end

  test "creating an Election" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"

    click_on "New Election"

    fill_in "Name", with: 'Create Election'
    choose('Private')

    click_on "Create Election"

    assert_text "Election was successfully created"
    click_on "Back"
  end

  test "updating an Election" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"

    click_on "Edit", match: :first

    fill_in "Name", with: 'Update Election'
    choose('Public')

    click_on "Update Election"

    assert_text "Election was successfully updated"
    click_on "Back"
  end

  test "destroying an Election" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"

    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Election was successfully destroyed"
  end
end
