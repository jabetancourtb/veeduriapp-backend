require "application_system_test_case"

class StatePublicationsTest < ApplicationSystemTestCase
  setup do
    @state_publication = state_publications(:one)
  end

  test "visiting the index" do
    visit state_publications_url
    assert_selector "h1", text: "State Publications"
  end

  test "creating a State publication" do
    visit state_publications_url
    click_on "New State Publication"

    fill_in "Comment", with: @state_publication.comment
    fill_in "Publication", with: @state_publication.publication_id
    fill_in "State", with: @state_publication.state
    fill_in "User", with: @state_publication.user_id
    click_on "Create State publication"

    assert_text "State publication was successfully created"
    click_on "Back"
  end

  test "updating a State publication" do
    visit state_publications_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @state_publication.comment
    fill_in "Publication", with: @state_publication.publication_id
    fill_in "State", with: @state_publication.state
    fill_in "User", with: @state_publication.user_id
    click_on "Update State publication"

    assert_text "State publication was successfully updated"
    click_on "Back"
  end

  test "destroying a State publication" do
    visit state_publications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "State publication was successfully destroyed"
  end
end
