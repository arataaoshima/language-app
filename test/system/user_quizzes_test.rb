require "application_system_test_case"

class UserQuizzesTest < ApplicationSystemTestCase
  setup do
    @user_quiz = user_quizzes(:one)
  end

  test "visiting the index" do
    visit user_quizzes_url
    assert_selector "h1", text: "User Quizzes"
  end

  test "creating a User quiz" do
    visit user_quizzes_url
    click_on "New User Quiz"

    fill_in "Quiz", with: @user_quiz.quiz_id
    fill_in "User", with: @user_quiz.user_id
    click_on "Create User quiz"

    assert_text "User quiz was successfully created"
    click_on "Back"
  end

  test "updating a User quiz" do
    visit user_quizzes_url
    click_on "Edit", match: :first

    fill_in "Quiz", with: @user_quiz.quiz_id
    fill_in "User", with: @user_quiz.user_id
    click_on "Update User quiz"

    assert_text "User quiz was successfully updated"
    click_on "Back"
  end

  test "destroying a User quiz" do
    visit user_quizzes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User quiz was successfully destroyed"
  end
end
