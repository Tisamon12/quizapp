class Question < ApplicationRecord
  belongs_to :category

  serialize :answers, Array

  validates :answers, length: {is: 4}

  validates :content, presence: true

  after_create :add_question_amount_to_category

  after_destroy :substract_question_amount_from_category


  private

  	def add_question_amount_to_category
  		category.question_amount += 1
  		category.save
  	end

  	def substract_question_amount_from_category
  		if category.present?
	  		category.question_amount -= 1
	  		category.save
	  	end
  	end
end
