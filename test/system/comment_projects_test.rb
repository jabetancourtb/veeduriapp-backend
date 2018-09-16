require "application_system_test_case"

class CommentProjectsTest < ApplicationSystemTestCase
  setup do
    @comment_project = comment_projects(:one)
  end

  test "visiting the index" do
    visit comment_projects_url
    assert_selector "h1", text: "Comment Projects"
  end

  test "creating a Comment project" do
    visit comment_projects_url
    click_on "New Comment Project"

    fill_in "Comment", with: @comment_project.comment
    fill_in "Project", with: @comment_project.project_id
    fill_in "User", with: @comment_project.user_id
    click_on "Create Comment project"

    assert_text "Comment project was successfully created"
    click_on "Back"
  end

  test "updating a Comment project" do
    visit comment_projects_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @comment_project.comment
    fill_in "Project", with: @comment_project.project_id
    fill_in "User", with: @comment_project.user_id
    click_on "Update Comment project"

    assert_text "Comment project was successfully updated"
    click_on "Back"
  end

  test "destroying a Comment project" do
    visit comment_projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comment project was successfully destroyed"
  end
end
