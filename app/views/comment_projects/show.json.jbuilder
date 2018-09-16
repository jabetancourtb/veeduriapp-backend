json.partial! "comment_projects/comment_project", comment_project: @comment_project

json.id @comment_project.id
json.user_id @comment_project.user_id
json.project_id @comment_project.project_id
json.state @comment_project.comment
json.created_at @comment_project.created_at
json.updated_at @comment_project.updated_at

json.user do
    json.name @comment_project.user.name
    json.email @comment_project.user.email
end