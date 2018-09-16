json.partial! "comment_publications/comment_publication", comment_publication: @comment_publication

json.id @comment_publication.id
json.user_id @comment_publication.user_id
json.project_id @comment_publication.publication_id
json.state @comment_publication.comment
json.created_at @comment_publication.created_at
json.updated_at @comment_publication.updated_at

json.user do
    json.name @comment_publication.user.name
    json.email @comment_publication.user.email
end
