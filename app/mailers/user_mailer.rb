class UserMailer < ApplicationMailer
	def cron_mail
		email = "info@marksmediaontwerp.nl"
		mail(to: email, subject: 'Cronjob heeft gelopen')
	end
end
