json.extract! image, :id, :title, :lat, :lng, :rotation, :tag, :date, :source, :uploadedBy, :imagesets_id, :created_at, :updated_at
json.url image_url(image, format: :json)
