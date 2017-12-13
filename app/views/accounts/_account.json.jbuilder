json.extract! account, :id, :email, :login_token, :token_generated_at, :created_at, :updated_at
json.url account_url(account, format: :json)
