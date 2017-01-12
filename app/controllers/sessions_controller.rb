class SessionsController < ApplicationController
	def create
		user = User.find_by_email(params[:email]) #zoek user aan de hand emailadres (doet rails zelf!)

		if user && user.authenticate(params[:password]) #Kijk of password gelijk is aan password
			session[:user_id] = user.id #start sessie met user id

			redirect_to '/'
		else
			redirect_to '/login'
		end
	end
	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end
end
