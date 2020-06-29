require "application_system_test_case"

class AnswersTest < ApplicationSystemTestCase
  setup do
    @user = users(:one)
    @question = questions(:one)
  end

  test "visiting the index" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"
    click_on "Show", match: :first

    click_on "Questions"

    click_on "Show", match: :first

    click_on "Answers"

    assert_selector "h1", text: "Answers"

    assert_text @question.answers.first.name
  end

  test "showing an Answer" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"
    click_on "Show", match: :first

    click_on "Questions"

    click_on "Show", match: :first

    click_on "Answers"

    click_on "Show", match: :first

    assert_text @question.answers.first.name

    click_on "Back"
  end

  test "creating an Answer" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"
    click_on "Show", match: :first

    click_on "Questions"

    click_on "Show", match: :first

    click_on "Answers"

    click_on "New Answer"

    fill_in "Name", with: 'Answer Create'

    click_on "Create Answer"

    assert_text "Answer was successfully created"
    click_on "Back"
  end

  test "updating an Answer" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"
    click_on "Show", match: :first

    click_on "Questions"

    click_on "Show", match: :first

    click_on "Answers"

    click_on "Edit", match: :first

    fill_in "Name", with: 'Answer Update'

    click_on "Update Answer"

    assert_text "Answer was successfully updated"
    click_on "Back"
  end

  test "destroying an Answer" do
    visit root_url
    click_on "Sign In"
    fill_in "Email", with: @user.email
    fill_in "Password", with: 'password'
    click_on "Log in"
    click_on "Show", match: :first

    click_on "Questions"

    click_on "Show", match: :first

    click_on "Answers"

    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Answer was successfully destroyed"
  end
end
