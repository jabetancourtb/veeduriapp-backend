require "application_system_test_case"

class CommentPublicationsTest < ApplicationSystemTestCase
  setup do
    @comment_publication = comment_publications(:one)
  end

  test "visiting the index" do
    visit comment_publications_url
    assert_selector "h1", text: "Comment Publications"
  end

  test "creating a Comment publication" do
    visit comment_publications_url
    click_on "New Comment Publication"

    fill_in "Comment", with: @comment_publication.comment
    fill_in "Publication", with: @comment_publication.publication_id
    fill_in "User", with: @comment_publication.user_id
    click_on "Create Comment publication"

    assert_text "Comment publication was successfully created"
    click_on "Back"
  end

  test "updating a Comment publication" do
    visit comment_publications_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @comment_publication.comment
    fill_in "Publication", with: @comment_publication.publication_id
    fill_in "User", with: @comment_publication.user_id
    click_on "Update Comment publication"

    assert_text "Comment publication was successfully updated"
    click_on "Back"
  end

  test "destroying a Comment publication" do
    visit comment_publications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Comment publication was successfully destroyed"
  end
end
