require 'test_helper'

class StateProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @state_project = state_projects(:one)
  end

  test "should get index" do
    get state_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_state_project_url
    assert_response :success
  end

  test "should create state_project" do
    assert_difference('StateProject.count') do
      post state_projects_url, params: { state_project: { comment: @state_project.comment, project_id: @state_project.project_id, state: @state_project.state, user_id: @state_project.user_id } }
    end

    assert_redirected_to state_project_url(StateProject.last)
  end

  test "should show state_project" do
    get state_project_url(@state_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_state_project_url(@state_project)
    assert_response :success
  end

  test "should update state_project" do
    patch state_project_url(@state_project), params: { state_project: { comment: @state_project.comment, project_id: @state_project.project_id, state: @state_project.state, user_id: @state_project.user_id } }
    assert_redirected_to state_project_url(@state_project)
  end

  test "should destroy state_project" do
    assert_difference('StateProject.count', -1) do
      delete state_project_url(@state_project)
    end

    assert_redirected_to state_projects_url
  end
end
