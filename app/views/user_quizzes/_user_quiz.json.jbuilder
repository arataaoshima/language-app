json.extract! user_quiz, :id, :user_id, :quiz_id, :created_at, :updated_at
json.url user_quiz_url(user_quiz, format: :json)
