json.extract! product, :id, :title, :description, :price, :length, :weight, :name, :created_at, :updated_at
json.url product_url(product, format: :json)