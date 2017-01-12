class User < ActiveRecord::Base
	has_secure_password

	validates :name, :password, :email, presence: true #kijk of naam, password en email tenminste aanwezig zijn
	validates :password, confirmation: true #kijk of password en password_confirmation hetzelfde zijn
	validates :email, uniqueness: true, on: :create #wanneer je een account aanmaakt, moet de email echt uniek zijn (zou ook zo moeten zijn als je alles update)
	validates_format_of :email, :with => /@/ #kijkt of er een @ in zit
	validates :password, length: {minimum: 8} #kijkt of wachwoord minimaal 8 tekens lang is

end
