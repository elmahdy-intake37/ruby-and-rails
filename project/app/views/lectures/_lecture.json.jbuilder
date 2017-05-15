json.extract! lecture, :id, :content, :attchment, :User_id, :Course_id, :created_at, :updated_at
json.url lecture_url(lecture, format: :json)
