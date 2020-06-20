module Api
	module V1
		class UsersController < ApplicationController
			before_action :authenticate_user, except: :create

			def create
				user = User.new(user_params)

				if user.save
					render json: {}, status: :ok
				else
					render json: { error: user.errors }, status: :unprocessable_entity
				end
			end

			def update
				user = current_user
				user.assign_attributes(user_params)

				if user.save
					render json: {}, status: :ok
				else
					render json: { error: user.errors }, status: :unprocessable_entity
				end
			end

			def destroy
				user = current_user

				if user.destroy
					render json: {}, status: :ok
				else
					render json: { error: user.errors }, status: :unprocessable_entity
				end
			end

			private
				def user_params
					params.require(:user).permit(:name, :password, :password_confirmation)
				end
		end
	end
end