json.extract! document, :id, :name, :cover_image, :first_page_image, :category_id, :created_at, :updated_at
json.url document_url(document, format: :json)
