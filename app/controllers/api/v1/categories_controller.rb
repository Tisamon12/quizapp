module Api
	module V1
		class CategoriesController < ApplicationController
			before_action :authenticate_user

			def index
				categories = Category.all.select(:id, :title)

				render json: {categories: categories}, status: :ok
			end

			def show
				category = Category.select(:title).find(params[:id])
				questions = category.questions.select(:id, :content, :answers, :correct_answer)

				render json: {category: category, questions: questions}, status: :ok
			end

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
				category.assign_attributes(category_params)

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

			def get_questions
				category = Category.find(params[:category_id])
				questions = category.questions.limit(5).order("RAND()").select(:id, :content, :answers)

				render json: {questions: questions}
			end

			private
				def category_params
					params.require(:category).permit(:title)
				end
		end
	end
end