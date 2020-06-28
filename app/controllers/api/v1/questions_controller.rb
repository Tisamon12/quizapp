module Api
	module V1
		class QuestionsController < ApplicationController
			before_action :authenticate_user
			before_action :get_category, only: [:index, :create]

			def index
				questions = @category.questions.select(:id, :content, :answers, :correct_answer, :category_id)

				render json: {questions: questions}, status: :ok
			end

			def create
				question = @category.questions.new(question_params)

				if question.save
					render json: {}, status: :ok
				else
					render json: { error: question.errors }, status: :unprocessable_entity
				end
			end

			def update
				question = Question.find(params[:id])
				question.assign_attributes(question_params)

				if question.save
					render json: {}, status: :ok
				else
					render json: { error: question.errors }, status: :unprocessable_entity
				end
			end

			def destroy
				question = Question.find(params[:id])

				if question.destroy
					render json: {}, status: :ok
				else
					render json: { error: question.errors }, status: :unprocessable_entity
				end
			end

			def answer
				question = Question.find(params[:id])

				if question.correct_answer == params[:answer]
					render json: {is_correct: true}, status: :ok
				else
					render json: {is_correct: false}, status: :ok
				end
			end

			private
				def question_params
					params.require(:question).permit(:content, :correct_answer, answers: [])
				end

				def get_category
					@category = Category.find(params[:category_id])
				end
		end
	end
end