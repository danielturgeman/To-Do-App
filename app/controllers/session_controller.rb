class SessionController < ApplicationController
  def auth
  token = params[:token].to_s
  account_id = params[:account_id] 
  account = Account.find_by(id: user_id)

  if !account || !account.valid_token?
    redirect_to root_path, notice: 'It seems your link is invalid. Try requesting for a new login link'
  elsif account.login_token_expired?
    redirect_to root_path, notice: 'Your login link has been expired. Try requesting for a new login link.'
  else
    sign_in_account(account)
    redirect_to root_path, notice: 'You have been signed in!'
  end
end
  end

  def new
end

def create
  value = params[:value].to_s
  user = Account.find_user_by(value)

  if !account
    redirect_to new_session_path, notice: "Uh oh! We couldn't find the username / email. Please try again."
  else
    account.send_login_link
    redirect_to root_path, notice: 'We have sent you the link to login to our app'
  end
end

end
