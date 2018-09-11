json.extract! state_publication, :id, :user_id, :publication_id, :comment, :state, :created_at, :updated_at
json.url state_publication_url(state_publication, format: :json)
