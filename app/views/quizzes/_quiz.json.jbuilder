json.extract! quiz, :id, :content, :answer, :category_id, :group_id, :created_at, :updated_at
json.url quiz_url(quiz, format: :json)
