module Api
	module V1
		class CategoriesController < ApplicationController
			before_action :authenticate_user

			def create
				category = Category.new(category_params)

				if category.save
					render json: {}, status: :ok
				else
					render json: { error: category.errors }, status: :unprocessable_entity
				end
			end

			def update
				category = Category.find(params[:id])
				category.assign_attributes(user_params)

				if category.save
					render json: {}, status: :ok
				else
					render json: { error: category.errors }, status: :unprocessable_entity
				end
			end

			def destroy
				category = Category.find(params[:id])

				if category.destroy
					render json: {}, status: :ok
				else
					render json: { error: category.errors }, status: :unprocessable_entity
				end
			end

			private
				def category_params
					params.require(:category).permit(:title)
				end
		end
	end
end