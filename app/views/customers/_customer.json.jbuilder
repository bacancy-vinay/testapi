json.extract! customer, :id, :name, :mobile, :available, :created_at, :updated_at
json.url customer_url(customer, format: :json)
