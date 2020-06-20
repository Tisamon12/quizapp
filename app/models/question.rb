class Question < ApplicationRecord
  belongs_to :category

  serialize :answers, Array

  validates :answers, length: {is: 4}

  validates :content, presence: true
end
