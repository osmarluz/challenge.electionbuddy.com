require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
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

    click_on "Questions"

    assert_selector "h1", text: "Questions"

    assert_text @election.questions.first.name
  end

  test "showing a Question" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"
    click_on "Show", match: :first

    click_on "Questions"

    click_on "Show", match: :first

    assert_text @election.questions.first.name

    click_on "Back"
  end

  test "creating a Question" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"
    click_on "Show", match: :first

    click_on "Questions"

    click_on "New Question"

    fill_in "Name", with: 'Create Question'

    click_on "Create Question"

    assert_text "Question was successfully created"
    click_on "Back"
  end

  test "updating a Question" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"
    click_on "Show", match: :first

    click_on "Questions"

    click_on "Edit", match: :first

    fill_in "Name", with: 'Update Question'

    click_on "Update Question"

    assert_text "Question was successfully updated"
    click_on "Back"
  end

  test "destroying a Question" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"
    click_on "Show", match: :first

    click_on "Questions"

    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Question was successfully destroyed"
  end
end
