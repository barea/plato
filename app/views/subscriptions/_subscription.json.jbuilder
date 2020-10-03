json.extract! subscription, :id, :organization_id, :plan_id, :status, :frequancey, :num_of_board, :num_of_seat, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
