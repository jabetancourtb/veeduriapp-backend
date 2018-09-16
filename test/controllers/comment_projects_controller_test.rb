require 'test_helper'

class CommentProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment_project = comment_projects(:one)
  end

  test "should get index" do
    get comment_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_project_url
    assert_response :success
  end

  test "should create comment_project" do
    assert_difference('CommentProject.count') do
      post comment_projects_url, params: { comment_project: { comment: @comment_project.comment, project_id: @comment_project.project_id, user_id: @comment_project.user_id } }
    end

    assert_redirected_to comment_project_url(CommentProject.last)
  end

  test "should show comment_project" do
    get comment_project_url(@comment_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_project_url(@comment_project)
    assert_response :success
  end

  test "should update comment_project" do
    patch comment_project_url(@comment_project), params: { comment_project: { comment: @comment_project.comment, project_id: @comment_project.project_id, user_id: @comment_project.user_id } }
    assert_redirected_to comment_project_url(@comment_project)
  end

  test "should destroy comment_project" do
    assert_difference('CommentProject.count', -1) do
      delete comment_project_url(@comment_project)
    end

    assert_redirected_to comment_projects_url
  end
end
