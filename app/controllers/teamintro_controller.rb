require 'firebase'

class TeamintroController < ApplicationController
  	def firstpage
	end
	
	def teamintro
  	end
	
	def BaseballLoginPage
		firebase_url = "https://baseball-ed142.firebaseio.com"
		firebase_secret = '7j77YGd2lMEIp3dUC3NbwjWQo0phhaPIPFKJFY49'
		firebase = Firebase::Client.new(firebase_url, firebase_secret)

		response = firebase.push("user", { :user_id => 'kyu', :user_id_seq => 1 })
	end
	
	def BaseballJoinPage
	end
	
	def	BaseballJoin
		@user=User.create(userid: params[:userid],  
                     	password: params[:password],
                     	password_confirmation: params[:password_confirmation],
		   			 	email: params[:email],
		  				teamname: params[:teamname])
         @user.save
     redirect_to root_path
	end
end
