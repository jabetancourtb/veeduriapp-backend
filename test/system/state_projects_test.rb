require "application_system_test_case"

class StateProjectsTest < ApplicationSystemTestCase
  setup do
    @state_project = state_projects(:one)
  end

  test "visiting the index" do
    visit state_projects_url
    assert_selector "h1", text: "State Projects"
  end

  test "creating a State project" do
    visit state_projects_url
    click_on "New State Project"

    fill_in "Comment", with: @state_project.comment
    fill_in "Project", with: @state_project.project_id
    fill_in "State", with: @state_project.state
    fill_in "User", with: @state_project.user_id
    click_on "Create State project"

    assert_text "State project was successfully created"
    click_on "Back"
  end

  test "updating a State project" do
    visit state_projects_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @state_project.comment
    fill_in "Project", with: @state_project.project_id
    fill_in "State", with: @state_project.state
    fill_in "User", with: @state_project.user_id
    click_on "Update State project"

    assert_text "State project was successfully updated"
    click_on "Back"
  end

  test "destroying a State project" do
    visit state_projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "State project was successfully destroyed"
  end
end
