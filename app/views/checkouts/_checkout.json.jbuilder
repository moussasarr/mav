json.extract! checkout, :id, :email, :string, :phone_number, :string, :order_id, :created_at, :updated_at
json.url checkout_url(checkout, format: :json)