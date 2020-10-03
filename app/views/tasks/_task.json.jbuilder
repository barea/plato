json.extract! task, :id, :text, :card_id, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
