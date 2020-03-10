json.extract! video, :id, :title, :url, :category_id, :group_id, :quiz_order, :created_at, :updated_at
json.url video_url(video, format: :json)
