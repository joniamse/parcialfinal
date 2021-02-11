json.extract! payment, :id, :import, :return, :bill_date, :created_at, :updated_at
json.url payment_url(payment, format: :json)
