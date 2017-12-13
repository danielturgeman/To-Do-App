class UserMailer < ApplicationMailer
	default from: 'turgemantesting@gmail.com'

	def welcome_new_account(account)
		@account = account
		@url = 'http://localhost.com/login_account'
		mail(to: @account.email, subject: 'Welcome to the TO-DO App!')
  end
end

