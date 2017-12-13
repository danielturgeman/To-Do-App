class NewAccountEmailMailer < ApplicationMailer
	def send_notification_to_account(account)
		@account = account
		mail(to: @account.email, subject: "Your new account activation")
	end
end
