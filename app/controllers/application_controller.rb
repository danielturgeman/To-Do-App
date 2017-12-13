class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def sign_in_account(account)
  user.expire_token!
  session[:email] = user.email
end

def current_account
  Account.find_by(email: session[:email])
end
end
