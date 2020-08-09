json.extract! interview, :id, :title, :image, :category_id, :created_at, :updated_at
json.url interview_url(interview, format: :json)
