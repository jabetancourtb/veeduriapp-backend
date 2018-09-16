require 'test_helper'

class CommentPublicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment_publication = comment_publications(:one)
  end

  test "should get index" do
    get comment_publications_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_publication_url
    assert_response :success
  end

  test "should create comment_publication" do
    assert_difference('CommentPublication.count') do
      post comment_publications_url, params: { comment_publication: { comment: @comment_publication.comment, publication_id: @comment_publication.publication_id, user_id: @comment_publication.user_id } }
    end

    assert_redirected_to comment_publication_url(CommentPublication.last)
  end

  test "should show comment_publication" do
    get comment_publication_url(@comment_publication)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_publication_url(@comment_publication)
    assert_response :success
  end

  test "should update comment_publication" do
    patch comment_publication_url(@comment_publication), params: { comment_publication: { comment: @comment_publication.comment, publication_id: @comment_publication.publication_id, user_id: @comment_publication.user_id } }
    assert_redirected_to comment_publication_url(@comment_publication)
  end

  test "should destroy comment_publication" do
    assert_difference('CommentPublication.count', -1) do
      delete comment_publication_url(@comment_publication)
    end

    assert_redirected_to comment_publications_url
  end
end
