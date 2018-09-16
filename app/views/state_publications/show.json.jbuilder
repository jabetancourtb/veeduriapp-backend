json.partial! "state_publications/state_publication", state_publication: @state_publication

json.id @state_publication.id
json.user_id @state_publication.user_id
json.project_id @state_publication.publication_id
json.state @state_publication.state
json.created_at @state_publication.created_at
json.updated_at @state_publication.updated_at

json.user do
    json.name @state_publication.user.name
    json.email @state_publication.user.email
end
