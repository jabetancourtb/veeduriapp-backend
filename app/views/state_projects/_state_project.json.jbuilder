json.extract! state_project, :id, :user_id, :project_id, :comment, :state, :created_at, :updated_at
json.url state_project_url(state_project, format: :json)
