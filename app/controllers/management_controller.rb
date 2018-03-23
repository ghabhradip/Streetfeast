class ManagementController < ApplicationController
	def show_users
		@users=User.all


		render partial: "home/user_data"
	end
end
