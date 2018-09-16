json.partial! "state_projects/state_project", state_project: @state_project

json.id @state_project.id
json.user_id @state_project.user_id
json.project_id @state_project.project_id
json.state @state_project.state
json.created_at @state_project.created_at
json.updated_at @state_project.updated_at

json.user do
    json.name @state_project.user.name
    json.email @state_project.user.email
end