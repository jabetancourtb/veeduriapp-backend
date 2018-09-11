require 'test_helper'

class StatePublicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @state_publication = state_publications(:one)
  end

  test "should get index" do
    get state_publications_url
    assert_response :success
  end

  test "should get new" do
    get new_state_publication_url
    assert_response :success
  end

  test "should create state_publication" do
    assert_difference('StatePublication.count') do
      post state_publications_url, params: { state_publication: { comment: @state_publication.comment, publication_id: @state_publication.publication_id, state: @state_publication.state, user_id: @state_publication.user_id } }
    end

    assert_redirected_to state_publication_url(StatePublication.last)
  end

  test "should show state_publication" do
    get state_publication_url(@state_publication)
    assert_response :success
  end

  test "should get edit" do
    get edit_state_publication_url(@state_publication)
    assert_response :success
  end

  test "should update state_publication" do
    patch state_publication_url(@state_publication), params: { state_publication: { comment: @state_publication.comment, publication_id: @state_publication.publication_id, state: @state_publication.state, user_id: @state_publication.user_id } }
    assert_redirected_to state_publication_url(@state_publication)
  end

  test "should destroy state_publication" do
    assert_difference('StatePublication.count', -1) do
      delete state_publication_url(@state_publication)
    end

    assert_redirected_to state_publications_url
  end
end
